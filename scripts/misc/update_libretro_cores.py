#!/usr/bin/env python3
"""Update the libretro cores under package/batocera to their latest version.

Every libretro-*.mk is looked at.  A core is updated when its source is a git
repository (GitHub, GitLab or Codeberg) and its <PKG>_VERSION is either

  * a full 40-character commit hash  -> moved to the newest commit of
    <PKG>_BRANCH if the .mk defines one, otherwise of the repo's default branch
  * a release tag (v1.2.3, 1.52, 2127.0-alpha3, ...)  -> moved to the highest
    tag of the same shape; pre-release tags are only chosen when the current
    tag is itself a pre-release

Cores built from release downloads (e.g. libretro-mame) are skipped.

With --update the script rewrites <PKG>_VERSION and the
"# Version: Commits on <date>" comment (date of the new commit).

Usage:
    update_libretro_cores.py                      # check every core
    update_libretro_cores.py libretro-fbneo ...   # check only these
    update_libretro_cores.py --update [core...]   # apply the updates
    update_libretro_cores.py --update --exclude libretro-dolphin,libretro-ppsspp

Only needs git and network access.  Set GITHUB_TOKEN to use the GitHub API for
commit dates (faster); without it dates are read with a shallow, blob-less git
fetch.  Standard library only.
"""
import argparse
import datetime
import json
import os
import re
import subprocess
import sys
import tempfile
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

SHA_RE = re.compile(r"^[0-9a-f]{40}$")
PRERELEASE_RE = re.compile(r"(alpha|beta|rc|pre|dev|test)", re.I)
HOSTS = {"github": "https://github.com/{o}/{r}.git", "gitlab": "https://gitlab.com/{o}/{r}.git"}
GIT_ENV = dict(os.environ, GIT_TERMINAL_PROMPT="0", GIT_ASKPASS="true")


class Core:
    def __init__(self, path):
        self.path = path
        self.name = path.stem
        self.text = path.read_text(encoding="utf-8")
        m = re.search(r"^(\w+?)_VERSION\s*=\s*(\S+)\s*$", self.text, re.M)
        self.prefix, self.version = (m.group(1), m.group(2)) if m else (None, None)

    def var(self, suffix):
        m = re.search(rf"^{self.prefix}_{suffix}\s*=\s*(.*?)\s*$", self.text, re.M)
        return m.group(1) if m else None

    def repo_url(self):
        """Return (git url, reason-if-unsupported)."""
        site = self.var("SITE")
        if not site:
            return None, "no _SITE"
        m = re.match(r"\$\(call (github|gitlab),([^,]+),([^,]+),.*\)$", site)
        if m:
            return HOSTS[m.group(1)].format(o=m.group(2), r=m.group(3)), None
        if re.search(r"/(releases|archive|-/archive)/", site):
            return None, "built from a release download"
        m = re.match(r"(https://(?:github\.com|gitlab\.com|codeberg\.org)/[^/]+/[^/]+?)(?:\.git)?/?$", site)
        if m:
            return m.group(1) + ".git", None
        return None, f"unsupported site {site}"


def git(*args, cwd=None, timeout=120):
    r = subprocess.run(["git", *args], cwd=cwd, env=GIT_ENV, capture_output=True, text=True, timeout=timeout)
    if r.returncode != 0:
        raise RuntimeError(r.stderr.strip().splitlines()[-1] if r.stderr.strip() else f"git {args[0]} failed")
    return r.stdout


def latest_commit(url, branch):
    ref = f"refs/heads/{branch}" if branch else "HEAD"
    out = git("ls-remote", url, ref).split()
    if not out:
        raise RuntimeError(f"{ref} not found")
    return out[0]


def tag_key(tag):
    """Sort key: numeric parts compare numerically."""
    return [(0, int(x)) if x.isdigit() else (1, x) for x in re.findall(r"\d+|[A-Za-z]+", tag)]


def tag_shape(tag):
    return re.sub(r"\d+", "#", tag)


def latest_tag(url, current):
    out = git("ls-remote", "--tags", "--refs", url)
    tags = [l.split("refs/tags/", 1)[1] for l in out.splitlines() if "refs/tags/" in l]
    allow_pre = bool(PRERELEASE_RE.search(current))
    shape = tag_shape(current)
    cands = [t for t in tags if tag_shape(t) == shape and (allow_pre or not PRERELEASE_RE.search(t))]
    if not cands:
        raise RuntimeError(f"no tag shaped like {current}")
    return max(cands, key=tag_key)


def commit_date(url, ref):
    """Date (datetime.date) of the commit that `ref` points to, or None."""
    token = os.environ.get("GITHUB_TOKEN")
    m = re.match(r"https://github\.com/([^/]+)/([^/]+?)\.git$", url)
    if token and m:
        try:
            req = urllib.request.Request(
                f"https://api.github.com/repos/{m.group(1)}/{m.group(2)}/commits/{ref}",
                headers={"Authorization": f"Bearer {token}", "Accept": "application/vnd.github+json",
                         "User-Agent": "batocera-update-libretro-cores"})
            data = json.load(urllib.request.urlopen(req, timeout=30))
            return datetime.date.fromisoformat(data["commit"]["committer"]["date"][:10])
        except Exception:
            pass
    with tempfile.TemporaryDirectory() as d:
        try:
            git("init", "-q", cwd=d)
            fetch_ref = ref if SHA_RE.match(ref) else f"refs/tags/{ref}"
            git("fetch", "-q", "--depth=1", "--filter=blob:none", url, fetch_ref, cwd=d, timeout=300)
            return datetime.date.fromisoformat(git("log", "-1", "--format=%cs", "FETCH_HEAD", cwd=d).strip())
        except Exception:
            return None


def check(core):
    """Return (status, new_version, detail)."""
    if not core.prefix:
        return "skip", None, "no _VERSION"
    url, why = core.repo_url()
    if not url:
        return "skip", None, why
    try:
        if SHA_RE.match(core.version):
            new = latest_commit(url, core.var("BRANCH"))
        else:
            new = latest_tag(url, core.version)
    except Exception as e:
        return "error", None, str(e)
    return ("ok" if new == core.version else "update"), new, url


def short(v):
    return v[:10] if SHA_RE.match(v) else v


def apply(core, url, new):
    day = commit_date(url, new)
    if day is None:
        day = datetime.date.today()
        note = " (commit date unavailable, used today's date)"
    else:
        note = ""
    text = re.sub(rf"^({core.prefix}_VERSION\s*=\s*)\S+", lambda m: m.group(1) + new, core.text, count=1, flags=re.M)
    text = re.sub(r"^# Version: .*$", f"# Version: Commits on {day.strftime('%b %d, %Y')}", text, count=1, flags=re.M)
    core.path.write_text(text, encoding="utf-8")
    return day, note


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("cores", nargs="*", help="core names (.mk file names without .mk); default: all libretro-*.mk")
    ap.add_argument("--update", action="store_true", help="apply updates (default: only report)")
    ap.add_argument("--exclude", default="", help="comma-separated core names to leave alone")
    ap.add_argument("--root", default=str(Path(__file__).resolve().parents[2]), help="repository root")
    ap.add_argument("-j", "--jobs", type=int, default=8)
    args = ap.parse_args()

    base = Path(args.root) / "package" / "batocera"
    exclude = {x.strip() for x in args.exclude.split(",") if x.strip()}
    cores = [Core(p) for p in sorted(base.rglob("libretro-*.mk"))]
    cores = [c for c in cores if c.name not in exclude and (not args.cores or c.name in args.cores)]
    missing = set(args.cores) - {c.name for c in cores} - exclude
    if missing:
        print(f"not found: {', '.join(sorted(missing))}", file=sys.stderr)
    if not cores:
        return 1

    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        results = list(ex.map(check, cores))

    counts = {"ok": 0, "update": 0, "skip": 0, "error": 0}
    for core, (status, new, detail) in zip(cores, results):
        if status == "ok":
            counts["ok"] += 1
            print(f"[ok]     {core.name}: {short(core.version)}")
        elif status == "skip":
            counts["skip"] += 1
            print(f"[skip]   {core.name}: {detail}")
        elif status == "error":
            counts["error"] += 1
            print(f"[error]  {core.name}: {detail}")
        else:
            counts["update"] += 1
            line = f"[update] {core.name}: {short(core.version)} -> {short(new)}"
            if args.update:
                day, note = apply(core, detail, new)
                line += f" ({day.strftime('%b %d, %Y')}){note}"
            print(line)

    print("\n" + ", ".join(f"{v} {k}" for k, v in counts.items()))
    if counts["update"] and not args.update:
        print("Run again with --update to apply.")
    elif counts["update"]:
        print("Review the diff: patches in each core's folder may no longer apply to the new version.")
    return 1 if counts["error"] else 0


if __name__ == "__main__":
    sys.exit(main())
