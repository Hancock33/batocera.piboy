#!/usr/bin/env python3
"""Update source-built packages that are not hosted on GitHub.

update_all_packages.py covers PyPI, GitHub, gitlab.com and Codeberg git
sources.  This script handles the source packages it skips:

  * git sources on other hosts (<PKG>_SITE_METHOD = git): commit-pinned ones
    move to the newest commit of <PKG>_BRANCH (or the default branch),
    tag-pinned ones to the highest tag of the same shape
    (eden, uqm, ryujinx, pacman, fake-hwclock, python-mkbootimg, ...)
  * tag archives on other forges: sourcehut (archive/, refs/download/) and
    self-hosted GitLab (-/archive/), e.g. grim, wlrctl, rtkit
  * release tarballs from a directory listing (the TARBALL set below:
    busybox, u-boot, xroar, xa, pm-utils, mono): the highest version of the
    same shape found in the <PKG>_SITE listing

By default the script applies the updates (use --check to only report): it
rewrites <PKG>_VERSION and the "# Version: Commits on <date>" comment, and
writes cleanup.sh with the commands that remove the old downloads and build
folders of the updated packages (see --log; nothing is deleted by the script).  For archive/tarball packages with a
.hash file it downloads the new archive and recomputes the hashes; license
file hashes are recomputed from inside the archive.  When a hash cannot be
recomputed nothing is written for that package.

Prebuilt binaries and data packages (NVIDIA, BigPEmu, Redream, Kodi language
packs, firmware, ...) are deliberately left out.

pacman is always excluded (see DEFAULT_EXCLUDE), on top of anything passed
with --exclude.

Usage:
    update_other_packages.py                    # update everything, write cleanup.sh
    update_other_packages.py xroar eden         # update only these
    update_other_packages.py --check -v         # only report, and list skipped ones
    update_other_packages.py --exclude uqm,eden
    update_other_packages.py --log old.sh       # cleanup commands to old.sh
    update_other_packages.py --no-log           # no cleanup script
Then review cleanup.sh and run it on the build machine: sh cleanup.sh

Also run by update_all_packages.py.  Needs git and network access.
Standard library only.
"""
import argparse
import datetime
import email.utils
import hashlib
import re
import shutil
import sys
import tarfile
import tempfile
import threading
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import update_libretro_cores as gitpkg  # noqa: E402

UA = "Mozilla/5.0 (X11; Linux x86_64) batocera-update-other-packages"

# Packages built from release tarballs published in a directory listing.
TARBALL = {
    "batocera-initramfs",  # busybox
    "uboot-anbernic-h700", "uboot-multiboard", "uboot-rk3326-mainline", "uboot-rk3562",
    "uboot-rk356x", "uboot-rk3576", "uboot-rk3588",
    "mono-src", "pm-utils", "xa", "xroar",
}

# Packages that are always left alone (in addition to --exclude).
DEFAULT_EXCLUDE = {"pacman"}

# Listing site -> (git repo, tag prefix) to read versions from when the
# listing cannot be fetched.
TAG_FALLBACK = {
    "https://u-boot.osuosl.org": ("https://source.denx.de/u-boot/u-boot.git", "v"),
}

GITHUB_RE = re.compile(r"github\.com|githubusercontent\.com|\$\(call github")
SOURCEHUT_RE = re.compile(r"^(https://git\.sr\.ht/~[^/]+/[^/]+)/(?:archive|refs/download)(?:/|$)")
GITLAB_ARCHIVE_RE = re.compile(r"^(https://[^/]+/.+?)/-/archive(?:/|$)")
HASH_ALGOS = {"md5", "sha1", "sha224", "sha256", "sha384", "sha512"}


class Progress:
    """A single, self-overwriting status line on stderr.

    Only active when enabled and stderr is a terminal, so piped or redirected
    output stays clean.  It is off when this module is imported (e.g. by
    update_all_packages.py); main() switches it on.
    """

    def __init__(self, enabled=False):
        self.enabled = enabled and sys.stderr.isatty()
        self.lock = threading.Lock()
        self.width = 0

    def show(self, msg):
        if not self.enabled:
            return
        with self.lock:
            msg = msg[:max(20, shutil.get_terminal_size().columns - 1)]
            sys.stderr.write("\r" + msg.ljust(self.width))
            sys.stderr.flush()
            self.width = len(msg)

    def clear(self):
        if self.enabled and self.width:
            with self.lock:
                sys.stderr.write("\r" + " " * self.width + "\r")
                sys.stderr.flush()
                self.width = 0

    def print(self, line):
        """Print a result line without mangling the status line."""
        self.clear()
        print(line, flush=True)


PROGRESS = Progress()


def human(n):
    if n < 1024:
        return f"{n} B"
    for unit in ("KB", "MB", "GB"):
        n /= 1024
        if n < 1024 or unit == "GB":
            return f"{n:.1f} {unit}"


def fetch(url, timeout=30):
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return r.read().decode("utf-8", errors="ignore")


def last_modified(url):
    try:
        req = urllib.request.Request(url, method="HEAD", headers={"User-Agent": UA})
        with urllib.request.urlopen(req, timeout=30) as r:
            lm = r.headers.get("Last-Modified")
        return email.utils.parsedate_to_datetime(lm).date() if lm else None
    except Exception:
        return None


def download(url, dest, label=""):
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    name = url.rsplit("/", 1)[-1]
    with urllib.request.urlopen(req, timeout=120) as r, open(dest, "wb") as f:
        total = int(r.headers.get("Content-Length") or 0)
        done = 0
        for chunk in iter(lambda: r.read(1 << 18), b""):
            f.write(chunk)
            done += len(chunk)
            if total:
                PROGRESS.show(f"{label}downloading {name} {done * 100 // total:3d}% ({human(done)} / {human(total)})")
            else:
                PROGRESS.show(f"{label}downloading {name} {human(done)}")


def digest(fileobj, algo):
    h = hashlib.new(algo)
    for chunk in iter(lambda: fileobj.read(1 << 20), b""):
        h.update(chunk)
    return h.hexdigest()


def newer(cands, current):
    """Highest candidate of the same shape as current, or None if none is newer."""
    allow_pre = bool(gitpkg.PRERELEASE_RE.search(current))
    shape = gitpkg.tag_shape(current)
    cands = {c for c in cands if gitpkg.tag_shape(c) == shape and (allow_pre or not gitpkg.PRERELEASE_RE.search(c))}
    best = max(cands, key=gitpkg.tag_key, default=None)
    return best if best and gitpkg.tag_key(best) > gitpkg.tag_key(current) else None


class Pkg:
    def __init__(self, path):
        self.path = Path(path)
        self.name = self.path.stem
        self.text = self.path.read_text(encoding="utf-8")
        self.prefix = re.sub(r"[^A-Za-z0-9]", "_", self.name).upper()
        self.version = self.var("VERSION")
        self.hash_path = self.path.with_suffix(".hash")
        self.mode, self.repo, self.tag_prefix, self.why = None, None, "", ""
        self._classify()

    def var(self, suffix, name=None):
        """Value of the first top-level assignment of <PREFIX>_<suffix> (or of `name`)."""
        name = name or f"{self.prefix}_{suffix}"
        m = re.search(rf"^{re.escape(name)}\s*[:?]?=\s*(.*?)\s*$", self.text, re.M)
        return m.group(1) if m else None

    @property
    def vref(self):
        return f"$({self.prefix}_VERSION)"

    @property
    def site(self):
        return (self.var("SITE") or "").rstrip("/")

    @property
    def source(self):
        return self.var("SOURCE") or f"{self.name}-{self.vref}.tar.gz"

    def resolve(self, template, version):
        """Expand $(VAR)s in template, with version for <PREFIX>_VERSION."""
        def sub(m, depth=0):
            name = m.group(1)
            if name == f"{self.prefix}_VERSION":
                return version
            val = self.var(None, name)
            if val is None or depth > 5:
                raise RuntimeError(f"cannot resolve $({name})")
            return re.sub(r"\$\((\w+)\)", lambda mm: sub(mm, depth + 1), val)
        out = re.sub(r"\$\((\w+)\)", sub, template)
        if "$(" in out:
            raise RuntimeError(f"cannot resolve {template}")
        return out

    def _classify(self):
        if not self.version:
            self.why = f"no {self.prefix}_VERSION"
            return
        if "$(" in self.version:
            self.why = "version is a variable"
            return
        site = self.site
        if not site:
            self.why = "no _SITE"
            return
        if GITHUB_RE.search(site):
            self.why = "GitHub source"
            return
        if (self.var("SITE_METHOD") or "").strip() == "git":
            if self.hash_path.exists():
                self.why = "git source with a .hash file"
                return
            self.mode, self.repo = "git", site
            return
        m = SOURCEHUT_RE.match(site) or GITLAB_ARCHIVE_RE.match(site)
        if m:
            self.mode = "tag"
            self.repo = m.group(1) if "git.sr.ht" in site else m.group(1) + ".git"
            # text right before $(VERSION) in its path segment = tag prefix ("v" in .../refs/download/v$(VERSION))
            tpl = site + "/" + self.source
            seg = re.search(r"([^/]*)" + re.escape(self.vref), tpl)
            self.tag_prefix = seg.group(1) if seg and seg.group(1) in ("v", "V", "release-") else ""
            return
        if self.name in TARBALL:
            self.mode = "listing"
            return
        self.why = "not a known source host (prebuilt or unsupported)"

    def source_regex(self):
        parts = re.split(r"(\$\(\w+\))", self.source)
        rx = ""
        for p in parts:
            if p == self.vref:
                rx += r"(?P<v>[0-9][\w.+~-]*?)"
            elif p.startswith("$("):
                rx += r"[\w.+~-]*?"
            else:
                rx += re.escape(p)
        return re.compile(r"(?<![\w.+~-])" + rx + r"(?=[\"'<>\s])")


def check(pkg):
    """Return (status, new_version, detail) like update_libretro_cores.check()."""
    if not pkg.mode:
        return "skip", None, pkg.why
    cur = pkg.version
    try:
        if pkg.mode == "git":
            if gitpkg.SHA_RE.match(cur):
                new = gitpkg.latest_commit(pkg.repo, pkg.var("BRANCH"))
                return ("ok" if new == cur else "update"), new, {"ref": new}
            if re.match(r"^[0-9a-f]{7,39}$", cur):
                return "skip", None, "abbreviated commit hash"
            tag = gitpkg.latest_tag(pkg.repo, cur)
            new = tag if gitpkg.tag_key(tag) > gitpkg.tag_key(cur) else None
            return ("update", new, {"ref": new}) if new else ("ok", cur, None)
        if pkg.mode == "tag" and gitpkg.SHA_RE.match(cur):  # archive of a pinned commit
            new = gitpkg.latest_commit(pkg.repo, pkg.var("BRANCH"))
            return ("ok" if new == cur else "update"), new, {"ref": new}
        if pkg.mode == "tag":
            tag =gitpkg.latest_tag(pkg.repo, pkg.tag_prefix + cur)
            new = tag[len(pkg.tag_prefix):]
            new = new if gitpkg.tag_key(new) > gitpkg.tag_key(cur) else None
            return ("update", new, {"ref": pkg.tag_prefix + new}) if new else ("ok", cur, None)
        # listing
        site = pkg.resolve(pkg.site, cur)
        try:
            html = fetch(site + "/")
            found = {m.group("v") for m in pkg.source_regex().finditer(html)}
            if not found:
                raise RuntimeError(f"no {pkg.source} in {site}/")
        except Exception as e:
            if site not in TAG_FALLBACK:
                raise
            repo, prefix = TAG_FALLBACK[site]
            out = gitpkg.git("ls-remote", "--tags", "--refs", repo)
            found = {l.split("refs/tags/", 1)[1][len(prefix):] for l in out.splitlines()
                     if f"refs/tags/{prefix}" in l}
            if not found:
                raise RuntimeError(f"{e}; no tags in {repo} either") from e
        new = newer(found, cur)
        return ("update", new, {}) if new else ("ok", cur, None)
    except Exception as e:
        return "error", None, str(e)


def new_hash_text(pkg, new, workdir, label=""):
    """Return the .hash file rewritten for version `new`."""
    old = pkg.version
    site = pkg.resolve(pkg.site, new)
    files = {}  # new file name -> local path

    def get(name):
        if name not in files:
            dest = Path(workdir) / name
            download(f"{site}/{name}", dest, label)
            files[name] = dest
        return files[name]

    out = []
    for line in pkg.hash_path.read_text(encoding="utf-8").splitlines(keepends=True):
        if line.lstrip().startswith("#") or not line.strip():
            out.append(line.replace(old, new))
            continue
        algo, dig, fname = line.split()[:3]
        if algo not in HASH_ALGOS:
            raise RuntimeError(f"unknown hash type {algo} in {pkg.hash_path.name}")
        if old in fname:
            nname = fname.replace(old, new)
            path = get(nname)
            PROGRESS.show(f"{label}{algo} of {nname}")
            with open(path, "rb") as f:
                ndig = digest(f, algo)
        else:  # a license file: hash it from inside the new archive
            main = pkg.resolve(pkg.source, new)
            arc = get(main)
            PROGRESS.show(f"{label}{algo} of {fname} inside {main}")
            if not tarfile.is_tarfile(arc):
                raise RuntimeError(f"cannot recompute hash of {fname}")
            with tarfile.open(arc) as t:
                member = next((m for m in t if m.isfile() and m.name.split("/", 1)[-1] == fname), None)
                if member is None:
                    raise RuntimeError(f"{fname} not found in {main}")
                ndig = digest(t.extractfile(member), algo)
            nname = fname
        line = line.replace(dig, ndig, 1)
        line = re.sub(rf"(\s){re.escape(fname)}(\s*)$", lambda m: m.group(1) + nname + m.group(2), line)
        out.append(line)
    return "".join(out)


def apply(pkg, new, detail, label=""):
    """Rewrite the .mk (and .hash); return (date, note)."""
    day = None
    hash_text = None
    if pkg.mode in ("git", "tag"):
        PROGRESS.show(f"{label}reading commit date")
        day = gitpkg.commit_date(pkg.repo, detail["ref"])
    if pkg.hash_path.exists() and pkg.mode != "git":
        with tempfile.TemporaryDirectory() as d:
            hash_text = new_hash_text(pkg, new, d, label)
    if day is None and pkg.mode == "listing":
        PROGRESS.show(f"{label}reading release date")
        try:
            day = last_modified(f"{pkg.resolve(pkg.site, new)}/{pkg.resolve(pkg.source, new)}")
        except Exception:
            day = None
    note = ""
    if day is None:
        day, note = datetime.date.today(), " (release date unavailable, used today's date)"

    text = re.sub(rf"^({pkg.prefix}_VERSION\s*[:?]?=\s*)\S+", lambda m: m.group(1) + new, pkg.text, count=1, flags=re.M)
    text = re.sub(r"^# Version: .*$", f"# Version: Commits on {day.strftime('%b %d, %Y')}", text, count=1, flags=re.M)
    pkg.path.write_text(text, encoding="utf-8", newline="\n")
    if hash_text is not None:
        pkg.hash_path.write_text(hash_text, encoding="utf-8", newline="\n")
        note += " (.hash updated)"
    return day, note


DEFAULT_LOG = "cleanup.sh"
DEFAULT_DL_DIR = "/home/lee/dl"
DEFAULT_BUILD_DIR = "/home/lee/build-dir/batocera.*/build"


def add_mode_args(ap):
    """--update/--check and the cleanup-log options, shared with update_all_packages.py."""
    ap.add_argument("--check", dest="update", action="store_false",
                    help="only report, do not change any file (default: apply the updates)")
    ap.add_argument("--update", dest="update", action="store_true", default=True,
                    help="apply the updates (the default; kept for compatibility)")
    ap.add_argument("--log", metavar="FILE",
                    help="shell script for the commands that remove the old downloads and build folders of "
                         f"the updated packages (default when updating: {DEFAULT_LOG}; nothing is deleted "
                         "by this script)")
    ap.add_argument("--no-log", action="store_true", help=f"do not write {DEFAULT_LOG}")
    ap.add_argument("--dl-dir", default=DEFAULT_DL_DIR, help=f"download dir for --log (default: {DEFAULT_DL_DIR})")
    ap.add_argument("--build-dir", default=DEFAULT_BUILD_DIR,
                    help=f"build dir glob for --log (default: {DEFAULT_BUILD_DIR})")


def log_path(args):
    """Where to write the cleanup log: --log, else cleanup.sh when updating; None for no log."""
    if args.no_log:
        return None
    return args.log or (DEFAULT_LOG if args.update else None)


def write_cleanup_log(path, names, dl_dir, build_dir, applied, script):
    """Write the cleanup commands for `names` to `path` as a shell script."""
    dl_dir, build_dir = dl_dir.rstrip("/"), build_dir.rstrip("/")
    lines = [
        "#!/bin/sh",
        f"# Old downloads and build folders of the packages {'updated' if applied else 'with an update available'}",
        f"# by {script} on {datetime.datetime.now():%Y-%m-%d %H:%M}." +
        ("" if applied else " The .mk files were NOT updated (--check)."),
        f"# Review before running: {build_dir}/*<pkg>-* also matches packages whose name",
        "# ends in <pkg> (e.g. libretro-mame for mame).",
        "",
    ]
    for name in sorted(set(names)):
        if not re.fullmatch(r"[A-Za-z0-9._+-]+", name):  # keep the script safe to run
            lines.append(f"# skipped {name!r}: unexpected characters in the name")
            continue
        lines += [f"# {name}",
                  f"sudo rm -rf {dl_dir}/{name}/{name}-*.tar.*",
                  f"sudo rm -rf {build_dir}/*{name}-*"]
    if not names:
        lines.append("# nothing to remove")
    Path(path).write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")


def find_packages(root, names=(), exclude=()):
    base = Path(root) / "package" / "batocera"
    mks = [m for m in sorted(base.rglob("*.mk"))
           if not m.name.startswith("pkg-") and m.stem not in exclude and (not names or m.stem in names)]
    return [Pkg(m) for m in mks]


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("packages", nargs="*", help="package names (.mk file names without .mk); default: all")
    ap.add_argument("--exclude", default="",
                    help=f"comma-separated package names to leave alone (always: {', '.join(sorted(DEFAULT_EXCLUDE))})")
    ap.add_argument("--root", default=str(Path(__file__).resolve().parents[2]), help="repository root")
    ap.add_argument("-j", "--jobs", type=int, default=8)
    ap.add_argument("-v", "--verbose", action="store_true", help="also list skipped packages")
    ap.add_argument("--no-progress", action="store_true", help="do not show the progress line")
    add_mode_args(ap)
    args = ap.parse_args()
    global PROGRESS
    PROGRESS = Progress(not args.no_progress)

    exclude = DEFAULT_EXCLUDE | {x.strip() for x in args.exclude.split(",") if x.strip()}
    pkgs = find_packages(args.root, args.packages, exclude)
    for name in sorted(set(args.packages) & exclude):
        print(f"excluded: {name}" + (" (always, see DEFAULT_EXCLUDE)" if name in DEFAULT_EXCLUDE else ""), file=sys.stderr)
    missing = set(args.packages) - {p.name for p in pkgs} - exclude
    if missing:
        print(f"not found: {', '.join(sorted(missing))}", file=sys.stderr)
    todo = [p for p in pkgs if p.mode]
    if args.verbose and args.packages:
        for p in pkgs:
            if not p.mode:
                print(f"[skip]   {p.name}: {p.why}")
    if not todo:
        return 1

    results = [None] * len(todo)
    running = {p.name for p in todo}
    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        futures = {ex.submit(check, p): i for i, p in enumerate(todo)}
        PROGRESS.show(f"Checking 0/{len(todo)}")
        for n, fut in enumerate(as_completed(futures), 1):
            i = futures[fut]
            results[i] = fut.result()
            running.discard(todo[i].name)
            waiting = ""
            if running:
                names = sorted(running)
                waiting = f", waiting for {', '.join(names[:3])}{'...' if len(names) > 3 else ''}"
            PROGRESS.show(f"Checking {n}/{len(todo)}{waiting}")
    PROGRESS.clear()

    counts = {"ok": 0, "update": 0, "error": 0}
    pending = []
    updated = []
    for pkg, (status, new, detail) in zip(todo, results):
        label = f"{pkg.name} ({pkg.mode})"
        if status == "ok":
            counts["ok"] += 1
            print(f"[ok]     {label}: {gitpkg.short(pkg.version)}")
        elif status in ("error", "skip"):
            counts["error"] += status == "error"
            print(f"[{status}]  {label}: {detail}")
        else:
            pending.append((pkg, new, detail, label))

    for n, (pkg, new, detail, label) in enumerate(pending, 1):
        line = f"[update] {label}: {gitpkg.short(pkg.version)} -> {gitpkg.short(new)}"
        if args.update:
            step = f"Updating {n}/{len(pending)} {pkg.name}: "
            try:
                PROGRESS.show(step.rstrip(": "))
                day, note = apply(pkg, new, detail, step)
                line += f" ({day.strftime('%b %d, %Y')}){note}"
            except Exception as e:
                counts["error"] += 1
                PROGRESS.print(f"[error]  {label}: {e}")
                continue
        counts["update"] += 1
        updated.append(pkg.name)
        PROGRESS.print(line)
    PROGRESS.clear()

    print("\n" + ", ".join(f"{v} {k}" for k, v in counts.items()))
    log = log_path(args)
    if log:
        write_cleanup_log(log, updated, args.dl_dir, args.build_dir, args.update, Path(__file__).name)
        print(f"Cleanup commands for {len(updated)} package(s) written to {log}")
    if counts["update"] and not args.update:
        print("Run again without --check to apply.")
    elif counts["update"]:
        print("Review the diff: patches in each package's folder may no longer apply to the new version.")
    return 1 if counts["error"] else 0


if __name__ == "__main__":
    sys.exit(main())
