#!/usr/bin/env python3
"""Update package/batocera/ports/eduke32/eduke32.mk to the latest upstream commit.

EDuke32 lives on voidpoint.io (a self-hosted GitLab), so the generic
update_all_packages.py skips it.  This script asks the voidpoint.io GitLab API
for the newest commit of the branch (default: the repo's default branch) and
rewrites EDUKE32_VERSION and the "# Version: Commits on <date>" comment.
If the API is unreachable it falls back to `git ls-remote` (and today's date).

Usage:
    update_eduke32.py                  # report only
    update_eduke32.py --update         # rewrite eduke32.mk
    update_eduke32.py --branch master --update

Also run by update_all_packages.py.  Standard library only.  The patches in
the package folder are not checked; review them after updating.
"""
import argparse
import datetime
import json
import os
import re
import subprocess
import sys
import urllib.parse
import urllib.request
from pathlib import Path

HOST = "https://voidpoint.io"
PROJECT = "terminx/eduke32"
MK_REL = Path("package/batocera/ports/eduke32/eduke32.mk")
SHA_RE = re.compile(r"^[0-9a-f]{40}$")


def api(path):
    url = f"{HOST}/api/v4/projects/{urllib.parse.quote(PROJECT, safe='')}{path}"
    req = urllib.request.Request(url, headers={"User-Agent": "batocera-update-eduke32"})
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.load(r)


def latest_commit(branch):
    """Return (sha, date-or-None, title-or-None)."""
    try:
        ref = branch or api("")["default_branch"]
        c = api(f"/repository/commits?ref_name={urllib.parse.quote(ref)}&per_page=1")[0]
        return c["id"], datetime.date.fromisoformat(c["committed_date"][:10]), c["title"]
    except Exception as e:
        print(f"GitLab API failed ({e}), falling back to git ls-remote", file=sys.stderr)
    ref = f"refs/heads/{branch}" if branch else "HEAD"
    env = dict(os.environ, GIT_TERMINAL_PROMPT="0")
    out = subprocess.run(["git", "ls-remote", f"{HOST}/{PROJECT}.git", ref],
                         capture_output=True, text=True, timeout=120, env=env, check=True).stdout.split()
    if not out:
        raise RuntimeError(f"{ref} not found")
    return out[0], None, None


def commits_behind(old, new):
    """Number of commits between old and new via the compare API, or None."""
    try:
        data = api(f"/repository/compare?from={old}&to={new}")
        return len(data.get("commits", []))
    except Exception:
        return None


def check(version, branch=None):
    """Return (status, new_sha, detail) like update_libretro_cores.check().

    detail is a dict with the commit "day" (date or None) and "title" on
    success, or the error message when status is "error".
    """
    if not SHA_RE.match(version or ""):
        return "skip", None, "EDUKE32_VERSION is not a full commit hash"
    try:
        new, day, title = latest_commit(branch)
    except Exception as e:
        return "error", None, str(e)
    return ("ok" if new == version else "update"), new, {"day": day, "title": title}


def apply(mk, new, detail):
    """Rewrite EDUKE32_VERSION and the version comment; return (date, note)."""
    day, note = detail.get("day"), ""
    if day is None:
        day, note = datetime.date.today(), " (commit date unavailable, used today's date)"
    text = Path(mk).read_text(encoding="utf-8")
    text = re.sub(r"^(EDUKE32_VERSION\s*=\s*)\S+", lambda m: m.group(1) + new, text, count=1, flags=re.M)
    text = re.sub(r"^# Version: .*$", f"# Version: Commits on {day.strftime('%b %d, %Y')}", text, count=1, flags=re.M)
    Path(mk).write_text(text, encoding="utf-8", newline="\n")
    return day, note


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--update", action="store_true", help="rewrite eduke32.mk (default: only report)")
    ap.add_argument("--branch", help="branch to follow (default: the repo's default branch)")
    ap.add_argument("--root", default=str(Path(__file__).resolve().parents[2]), help="repository root")
    args = ap.parse_args()

    mk = Path(args.root) / MK_REL
    m = re.search(r"^EDUKE32_VERSION\s*=\s*(\S+)\s*$", mk.read_text(encoding="utf-8"), re.M)
    if not m:
        print(f"EDUKE32_VERSION not found in {mk}", file=sys.stderr)
        return 1
    current = m.group(1)

    status, new, detail = check(current, args.branch)
    if status != "update":
        if status == "ok":
            print(f"[ok]     eduke32: {current[:10]} is the latest commit")
            return 0
        print(f"[{status}]  eduke32: {detail}", file=sys.stderr)
        return 1

    behind = commits_behind(current, new)
    line = f"[update] eduke32: {current[:10]} -> {new[:10]}"
    if behind is not None:
        line += f" ({behind} new commit{'s' if behind != 1 else ''})"
    print(line)
    if detail["title"]:
        print(f"         latest: {detail['title']}")

    if not args.update:
        print("Run again with --update to apply.")
        return 0

    day, note = apply(mk, new, detail)
    print(f"Updated {MK_REL.as_posix()} ({day.strftime('%b %d, %Y')}){note}")
    print("Review the patches in package/batocera/ports/eduke32/: they may no longer apply.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
