#!/usr/bin/env python3
"""Update every package under package/batocera to its latest upstream version.

Runs the PyPI logic of update_pypi_packages.py and the git logic of
update_libretro_cores.py over *all* package .mk files, so one command covers:

  * PyPI-sourced packages (sdist on files.pythonhosted.org): new version,
    site, md5/sha256 and LICENSE_FILES hashes
  * git-sourced packages (GitHub / GitLab / Codeberg): commit-pinned ones move
    to the newest commit of <PKG>_BRANCH (or the default branch), tag-pinned
    ones to the highest tag of the same shape

Skipped, with the reason listed in the summary: packages that download
tarballs from somewhere else (kodi mirrors, kernel.org, ...), packages that
have a .hash file but a git source (the archive hash would need recomputing),
.mk files with several *_VERSION lines, versions that are variables or
abbreviated hashes.  Use scripts/linux/check_package_updates.py for the
special-cased packages (kernel, firmware, mesa, nvidia, ...).

jstest2 is always excluded (see DEFAULT_EXCLUDE), on top of anything passed
with --exclude.

Usage:
    update_all_packages.py                          # check everything
    update_all_packages.py -v                       # ...and list ok/skipped ones
    update_all_packages.py --path emulators/retroarch/libretro
    update_all_packages.py --only pypi              # or --only git
    update_all_packages.py --update pcsx2 libretro-fbneo
    update_all_packages.py --update --exclude linux,wine-custom

Needs git and network access.  Standard library only.
"""
import argparse
import re
import sys
import urllib.error
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import update_libretro_cores as gitpkg  # noqa: E402
import update_pypi_packages as pypi  # noqa: E402

SHORT_SHA_RE = re.compile(r"^[0-9a-f]{7,39}$")

# Packages that are always left alone (in addition to --exclude).
DEFAULT_EXCLUDE = {"jstest2"}


def classify(mk):
    """Return ('pypi', Package) | ('git', Core) | ('skip', reason)."""
    pkg = pypi.Package(mk)
    if pkg.is_pypi:
        return "pypi", pkg
    core = gitpkg.Core(mk)
    if not core.prefix:
        return "skip", "no _VERSION line"
    if len(re.findall(r"^\w+_VERSION\s*=", core.text, re.M)) > 1:
        return "skip", "several _VERSION lines"
    if "$(" in core.version:
        return "skip", "version is a variable"
    if SHORT_SHA_RE.match(core.version):
        return "skip", "abbreviated commit hash"
    url, why = core.repo_url()
    if not url:
        return "skip", why if why.startswith(("no ", "built")) else "not a git source (other host/tarball)"
    if mk.with_suffix(".hash").exists():
        return "skip", "git source with a .hash file"
    return "git", core


def check_item(item, index):
    kind, obj = item
    if kind == "pypi":
        try:
            rel = pypi.lookup(obj, index)
        except (urllib.error.URLError, RuntimeError, KeyError, ValueError) as e:
            return "error", None, str(e)
        return ("update" if pypi.is_newer(rel["version"], obj.version) else "ok"), rel["version"], rel
    status, new, detail = gitpkg.check(obj)
    if status == "error" and detail.startswith("no tag shaped like"):
        return "skip", None, "no comparable tags"
    return status, new, detail


def apply_item(item, new, detail, no_license_hash):
    kind, obj = item
    if kind == "pypi":
        pypi.update_package(obj, detail, no_license_hash)
        return ""
    day, note = gitpkg.apply(obj, detail, new)
    return f" ({day.strftime('%b %d, %Y')}){note}"


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("packages", nargs="*", help="package names (.mk file names without .mk); default: all")
    ap.add_argument("--update", action="store_true", help="apply updates (default: only report)")
    ap.add_argument("--only", choices=("pypi", "git"), help="only this kind of package")
    ap.add_argument("--path", default="", help="only .mk files below package/batocera/<PATH>")
    ap.add_argument("--exclude", default="", help="comma-separated package names to leave alone")
    ap.add_argument("--no-license-hash", action="store_true", help="PyPI: do not recompute LICENSE_FILES hashes")
    ap.add_argument("--index", default=pypi.DEFAULT_INDEX, help="PyPI JSON index")
    ap.add_argument("--root", default=str(Path(__file__).resolve().parents[2]), help="repository root")
    ap.add_argument("-j", "--jobs", type=int, default=16)
    ap.add_argument("-v", "--verbose", action="store_true", help="also list up-to-date and skipped packages")
    args = ap.parse_args()

    base = Path(args.root) / "package" / "batocera" / args.path
    exclude = DEFAULT_EXCLUDE | {x.strip() for x in args.exclude.split(",") if x.strip()}
    mks = [m for m in sorted(base.rglob("*.mk"))
           if not m.name.startswith("pkg-") and m.stem not in exclude
           and (not args.packages or m.stem in args.packages)]
    missing = set(args.packages) - {m.stem for m in mks}
    if missing:
        print(f"not found: {', '.join(sorted(missing))}", file=sys.stderr)
    if not mks:
        return 1

    classified = [(m, classify(m)) for m in mks]
    skipped = [(m, c[1]) for m, c in classified if c[0] == "skip"]
    todo = [(m, (c[0], c[1])) for m, c in classified if c[0] != "skip" and (not args.only or c[0] == args.only)]

    index = args.index.rstrip("/")
    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        results = list(ex.map(lambda t: check_item(t[1], index), todo))

    counts = Counter()
    pending = []
    for (mk, item), (status, new, detail) in zip(todo, results):
        name, kind = mk.stem, item[0]
        if status == "skip":
            skipped.append((mk, detail))
        elif status == "ok":
            counts["ok"] += 1
            if args.verbose:
                print(f"[ok]     {name}: {gitpkg.short(item[1].version)}")
        elif status == "error":
            counts["error"] += 1
            print(f"[error]  {name}: {detail}")
        else:
            counts["update"] += 1
            pending.append((mk, item, new, detail))

    def do(p):
        mk, item, new, detail = p
        try:
            return apply_item(item, new, detail, args.no_license_hash), None
        except Exception as e:  # report and carry on with the other packages
            return "", str(e)

    applied = [("", None)] * len(pending)
    if args.update and pending:
        with ThreadPoolExecutor(max_workers=min(args.jobs, 8)) as ex:
            applied = list(ex.map(do, pending))

    for (mk, item, new, detail), (extra, err) in zip(pending, applied):
        kind, obj = item
        new_s = gitpkg.short(new)
        if err:
            counts["update"] -= 1
            counts["error"] += 1
            print(f"[error]  {mk.stem}: {err}")
        else:
            print(f"[update] {mk.stem} ({kind}): {gitpkg.short(obj.version)} -> {new_s}{extra}")

    if args.verbose:
        for mk, why in skipped:
            print(f"[skip]   {mk.stem}: {why}")

    reasons = Counter(why for _, why in skipped)
    print(f"\n{len(mks)} package(s): " + ", ".join(f"{counts[k]} {k}" for k in ("ok", "update", "error")) +
          f", {len(skipped)} skipped")
    for why, n in reasons.most_common():
        print(f"    skipped {n:>3}: {why}")
    if counts["update"] and not args.update:
        print("Run again with --update to apply.")
    elif counts["update"]:
        print("Review the diff: patches, dependencies and license files may need attention after a version bump.")
    return 1 if counts["error"] else 0


if __name__ == "__main__":
    sys.exit(main())
