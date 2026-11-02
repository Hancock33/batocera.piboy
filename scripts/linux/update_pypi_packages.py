#!/usr/bin/env python3
"""Update the PyPI-sourced packages under package/batocera.

A package is PyPI-sourced when its .mk file has a *_SITE pointing at
https://files.pythonhosted.org/packages/<xx>/<yy>/<hash>.  For each one this
script asks PyPI for the latest release and, with --update, rewrites:

  * <PKG>_VERSION and <PKG>_SITE (and <PKG>_SOURCE if the sdist was renamed)
  * the "# Version: Commits on ..." comment in the .mk file
  * the md5/sha256 lines of the sdist in <pkg>.hash (if the file exists)
  * the sha256 of each <PKG>_LICENSE_FILES entry in <pkg>.hash, computed from
    the new sdist (skip with --no-license-hash)

Usage:
    update_pypi_packages.py                       # check every PyPI package
    update_pypi_packages.py python-hidapi ...     # check only these
    update_pypi_packages.py --update [package...] # apply the updates
    update_pypi_packages.py --update --python     # only libraries/python

Standard library only.  Needs network access to pypi.org and
files.pythonhosted.org.
"""
import argparse
import datetime
import hashlib
import io
import json
import os
import re
import sys
import tarfile
import urllib.error
import urllib.request
import zipfile
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

PYPI_SITE_RE = re.compile(r"^(\w+)_SITE\s*=\s*(https://files\.pythonhosted\.org/packages/\S+)\s*$", re.M)
DEFAULT_INDEX = "https://pypi.org/pypi"
UA = {"User-Agent": "batocera-update-pypi-packages/1.0"}


def fetch(url, timeout=60):
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return r.read()


def parse_version(v):
    try:
        from packaging.version import Version
        return Version(v)
    except Exception:
        return tuple(int(x) for x in re.findall(r"\d+", v))


def is_newer(new, old):
    try:
        return parse_version(new) > parse_version(old)
    except TypeError:
        return new != old


def sha256_of(data):
    return hashlib.sha256(data).hexdigest()


def read_member(sdist_bytes, filename, relpath):
    """Return the bytes of <top-level-dir>/<relpath> from an sdist, or None."""
    if filename.endswith((".tar.gz", ".tgz", ".tar.bz2", ".tar.xz")):
        with tarfile.open(fileobj=io.BytesIO(sdist_bytes)) as t:
            names = [m for m in t.getmembers() if m.isfile()]
            for m in names:
                parts = m.name.split("/", 1)
                if len(parts) == 2 and parts[1] == relpath:
                    return t.extractfile(m).read()
    elif filename.endswith(".zip"):
        with zipfile.ZipFile(io.BytesIO(sdist_bytes)) as z:
            for n in z.namelist():
                parts = n.split("/", 1)
                if len(parts) == 2 and parts[1] == relpath:
                    return z.read(n)
    return None


class Package:
    def __init__(self, mk_path):
        self.mk_path = mk_path
        self.name = mk_path.stem
        self.text = mk_path.read_text(encoding="utf-8")
        m = PYPI_SITE_RE.search(self.text)
        self.prefix = m.group(1) if m else None
        self.site = m.group(2) if m else None

    @property
    def is_pypi(self):
        return self.prefix is not None

    def var(self, suffix):
        m = re.search(rf"^{self.prefix}_{suffix}\s*=\s*(.*?)\s*$", self.text, re.M)
        return m.group(1) if m else None

    @property
    def version(self):
        return self.var("VERSION")

    @property
    def source_raw(self):
        return self.var("SOURCE")

    @property
    def source(self):
        s = self.source_raw
        return s.replace(f"$({self.prefix}_VERSION)", self.version) if s else None

    @property
    def project(self):
        """PyPI project name, derived from the sdist file name."""
        stem = re.sub(r"\.(tar\.gz|tgz|tar\.bz2|tar\.xz|zip)$", "", self.source)
        return stem[: -(len(self.version) + 1)]

    @property
    def license_files(self):
        v = self.var("LICENSE_FILES")
        return v.split() if v else []

    @property
    def hash_path(self):
        return self.mk_path.with_suffix(".hash")


def find_packages(root, names, only_python):
    base = root / "package" / "batocera"
    if only_python:
        base = base / "python"
    pkgs = []
    for mk in sorted(base.rglob("*.mk")):
        if names and mk.stem not in names:
            continue
        p = Package(mk)
        if p.is_pypi:
            pkgs.append(p)
    return pkgs


def lookup(pkg, index):
    """Return dict with the latest release info for pkg, or raise."""
    data = json.loads(fetch(f"{index}/{pkg.project}/json"))
    ver = data["info"]["version"]
    sdists = [u for u in data["urls"] if u["packagetype"] == "sdist" and not u.get("yanked")]
    if not sdists:
        raise RuntimeError(f"no sdist for {pkg.project} {ver}")
    u = sdists[0]
    return {
        "version": ver,
        "url": u["url"],
        "filename": u["filename"],
        "md5": u["digests"]["md5"],
        "sha256": u["digests"]["sha256"],
        "date": u["upload_time_iso_8601"][:10],
    }


def apply_update(pkg, rel, license_hashes):
    prefix = pkg.prefix
    old_ver, old_src = pkg.version, pkg.source
    text = pkg.text
    new_src_raw = rel["filename"].replace(rel["version"], f"$({prefix}_VERSION)")
    text = re.sub(rf"^({prefix}_VERSION\s*=\s*).*$", rf"\g<1>{rel['version']}", text, flags=re.M)
    text = re.sub(rf"^({prefix}_SOURCE\s*=\s*).*$", lambda m: m.group(1) + new_src_raw, text, flags=re.M)
    new_site = rel["url"].rsplit("/", 1)[0]
    text = re.sub(rf"^({prefix}_SITE\s*=\s*).*$", lambda m: m.group(1) + new_site, text, flags=re.M)
    day = datetime.date.fromisoformat(rel["date"])
    text = re.sub(r"^# Version: .*$", f"# Version: Commits on {day.strftime('%b %d, %Y')}", text, count=1, flags=re.M)
    pkg.mk_path.write_text(text, encoding="utf-8")

    if not pkg.hash_path.exists():
        return
    out = []
    for line in pkg.hash_path.read_text(encoding="utf-8").split("\n"):
        t = line.split()
        if len(t) == 3 and t[2] == old_src and t[0] in ("md5", "sha256"):
            line = f"{t[0]}  {rel[t[0]]}  {rel['filename']}"
        elif len(t) == 3 and t[0] == "sha256" and t[2] in license_hashes:
            line = f"{t[0]}  {license_hashes[t[2]]}  {t[2]}"
        out.append(line)
    pkg.hash_path.write_text("\n".join(out), encoding="utf-8")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("packages", nargs="*", help="package names (.mk file names without .mk); default: all PyPI packages")
    ap.add_argument("--update", action="store_true", help="apply updates (default: only report)")
    ap.add_argument("--python", action="store_true", help="only look in package/batocera/libraries/python")
    ap.add_argument("--no-license-hash", action="store_true", help="do not recompute LICENSE_FILES hashes")
    ap.add_argument("--root", default=str(Path(__file__).resolve().parents[2]), help="repository root")
    ap.add_argument("--index", default=DEFAULT_INDEX, help=f"PyPI JSON index (default {DEFAULT_INDEX})")
    ap.add_argument("-j", "--jobs", type=int, default=8)
    args = ap.parse_args()

    root = Path(args.root)
    pkgs = find_packages(root, set(args.packages), args.python)
    unknown = set(args.packages) - {p.name for p in pkgs}
    if unknown:
        print(f"not found or not PyPI-sourced: {', '.join(sorted(unknown))}", file=sys.stderr)
    if not pkgs:
        return 1

    def job(p):
        try:
            return p, lookup(p, args.index.rstrip("/")), None
        except (urllib.error.URLError, RuntimeError, KeyError, ValueError) as e:
            return p, None, e

    failures = 0
    updated = 0
    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        results = list(ex.map(job, pkgs))

    for p, rel, err in results:
        if err:
            failures += 1
            print(f"[error]  {p.name}: {err}")
            continue
        if not is_newer(rel["version"], p.version):
            print(f"[ok]     {p.name}: {p.version}")
            continue
        print(f"[update] {p.name}: {p.version} -> {rel['version']}")
        if not args.update:
            continue
        try:
            license_hashes = {}
            need_download = p.hash_path.exists() and p.license_files and not args.no_license_hash
            if need_download or p.hash_path.exists():
                blob = fetch(rel["url"], timeout=120)
                if sha256_of(blob) != rel["sha256"]:
                    raise RuntimeError("sha256 of downloaded sdist does not match PyPI")
                if need_download:
                    for lf in p.license_files:
                        data = read_member(blob, rel["filename"], lf)
                        if data is None:
                            print(f"         warning: {lf} not found in new sdist; keeping old hash")
                        else:
                            license_hashes[lf] = sha256_of(data)
            apply_update(p, rel, license_hashes)
            updated += 1
        except (urllib.error.URLError, RuntimeError, tarfile.TarError, zipfile.BadZipFile) as e:
            failures += 1
            print(f"[error]  {p.name}: {e}")

    if args.update:
        print(f"\nupdated {updated} package(s), {failures} failure(s)")
        if updated:
            print("Review the diff: dependencies and license files may have changed between versions.")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
