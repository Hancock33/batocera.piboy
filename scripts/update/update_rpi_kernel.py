#!/usr/bin/env python3
"""
Update the raspberrypi/linux commit id used in Batocera .board files.

Examples:
    python update_rpi_kernel.py --branch rpi-7.3.y --dry-run
    python update_rpi_kernel.py --branch rpi-7.3.y                 # edit, commit and push
    python update_rpi_kernel.py --branch rpi-7.3.y --no-push       # edit and commit only
    python update_rpi_kernel.py --branch rpi-7.3.y --no-commit     # edit files only
    python update_rpi_kernel.py --branch rpi-7.3.y --root V:\\github\\batocera.se
    python update_rpi_kernel.py --branch rpi-7.3.y --old e4d5c8fdad5e5a5bffe85bb1a755feb1a65eed1b

By default the old commit id is auto-detected from the
"$(call github,raspberrypi,linux,<sha>)/<sha>.tar.gz" lines in the board files.
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import urllib.error
import urllib.request

REPO = "raspberrypi/linux"
SHA_RE = re.compile(r"^[0-9a-f]{40}$")
# matches: github,raspberrypi,linux,<sha>)/<sha>.tar.gz
URL_RE = re.compile(r"github,raspberrypi,linux,([0-9a-f]{40})\)/([0-9a-f]{40})\.tar\.gz")


def latest_commit_git(branch):
    """Resolve branch head with git ls-remote (no API rate limits)."""
    if not shutil.which("git"):
        return None
    try:
        out = subprocess.run(
            ["git", "ls-remote", f"https://github.com/{REPO}.git", f"refs/heads/{branch}"],
            capture_output=True, text=True, timeout=60, check=True,
        ).stdout.strip()
    except (subprocess.SubprocessError, OSError):
        return None
    if not out:
        return None
    sha = out.split()[0]
    return sha if SHA_RE.match(sha) else None


def latest_commit_api(branch):
    """Resolve branch head with the GitHub REST API (honours GITHUB_TOKEN)."""
    url = f"https://api.github.com/repos/{REPO}/commits/{branch}"
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "update-rpi-kernel"}
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    try:
        with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=30) as r:
            sha = json.load(r)["sha"]
    except (urllib.error.URLError, KeyError, ValueError) as e:
        print(f"GitHub API lookup failed: {e}", file=sys.stderr)
        return None
    return sha if SHA_RE.match(sha) else None


def find_board_files(root, patterns):
    found = []
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in (".git", "output", "dl")]
        for f in filenames:
            if any(f.endswith(p) for p in patterns):
                found.append(os.path.join(dirpath, f))
    return sorted(found)


def git(repo, *cmd):
    """Run a git command in repo, exit with git's error output on failure."""
    r = subprocess.run(["git", "-C", repo, *cmd], capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit(f"git {' '.join(cmd)} failed:\n{r.stderr.strip() or r.stdout.strip()}")
    return r.stdout.strip()


def upstream_commit_info(sha):
    """Best-effort: subject and date of the upstream commit (GitHub API)."""
    url = f"https://api.github.com/repos/{REPO}/commits/{sha}"
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "update-rpi-kernel"}
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    try:
        with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=15) as r:
            c = json.load(r)["commit"]
        return c["message"].splitlines()[0], c["committer"]["date"]
    except (urllib.error.URLError, KeyError, ValueError, OSError):
        return None, None


def build_commit_message(args, repo, changed_files, olds, new):
    old_short = ", ".join(o[:8] for o in sorted(olds))
    subject = f"kernel: bump raspberrypi/linux to {args.branch} ({new[:8]})"
    title, date = upstream_commit_info(new)

    body = [
        f"Update the Raspberry Pi kernel tarball commit from {old_short} to {new[:8]}",
        f"(head of branch {args.branch} on {REPO}).",
        "",
        "Files updated:",
        *[f"- {os.path.relpath(p, repo)}" for p in changed_files],
        "",
        "Upstream:",
        f"- new commit: {new}",
    ]
    if title:
        body.append(f"- subject: {title}")
    if date:
        body.append(f"- date: {date}")
    for o in sorted(olds):
        body.append(f"- diff: https://github.com/{REPO}/compare/{o}...{new}")
    body += [
        "",
        "Note: check the kernel version comment and linux_patches/<version> path",
        "if the branch is a different kernel series.",
    ]
    return subject + "\n\n" + "\n".join(body)


def git_commit_and_push(args, changed_files, olds, new):
    if not shutil.which("git"):
        sys.exit("git not found in PATH; files were updated but not committed.")
    repo = git(args.root, "rev-parse", "--show-toplevel")

    message = args.message or build_commit_message(args, repo, changed_files, olds, new)

    # git add: stage only the files this script changed
    git(repo, "add", "--", *changed_files)
    print("Staged:\n" + git(repo, "diff", "--cached", "--stat"))
    # git commit: subject line + description body, limited to the staged files
    git(repo, "commit", "-m", message, "--", *changed_files)
    print(f"Committed: {git(repo, 'log', '-1', '--format=%h %s')}")

    if args.no_push:
        return
    branch = git(repo, "rev-parse", "--abbrev-ref", "HEAD")
    git(repo, "push", args.remote, branch)
    print(f"Pushed to {args.remote}/{branch}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--branch", required=True, help="raspberrypi/linux branch, e.g. rpi-7.3.y")
    ap.add_argument("--root", default=".", help="directory to search for board files (default: .)")
    ap.add_argument("--ext", nargs="+", default=[".board"], help="file suffixes to scan (default: .board)")
    ap.add_argument("--old", help="old commit id to replace (default: auto-detect)")
    ap.add_argument("--new", help="use this commit id instead of looking up the branch head")
    ap.add_argument("--dry-run", action="store_true", help="show changes without writing files, committing or pushing")
    ap.add_argument("--no-commit", action="store_true", help="only edit files, do not git commit or push")
    ap.add_argument("--no-push", action="store_true", help="git commit but do not push")
    ap.add_argument("--remote", default="origin", help="git remote to push to (default: origin)")
    ap.add_argument("--message", help="custom commit message (default: auto-generated)")
    args = ap.parse_args()

    new = args.new
    if not new:
        new = latest_commit_git(args.branch) or latest_commit_api(args.branch)
        if not new:
            sys.exit(f"Could not resolve branch '{args.branch}' on {REPO}")
    if not SHA_RE.match(new):
        sys.exit(f"Invalid new commit id: {new}")
    print(f"Branch {args.branch} -> {new}")

    files = find_board_files(args.root, args.ext)
    if not files:
        sys.exit(f"No files matching {args.ext} under {args.root}")

    # collect old ids
    olds = set()
    if args.old:
        if not SHA_RE.match(args.old):
            sys.exit(f"Invalid old commit id: {args.old}")
        olds.add(args.old)
    else:
        for path in files:
            with open(path, encoding="utf-8", newline="") as fh:
                for m in URL_RE.finditer(fh.read()):
                    olds.update(m.groups())
    olds.discard(new)
    if not olds:
        print("Nothing to update (already at that commit, or no raspberrypi/linux URL found).")
        return
    print("Replacing:", ", ".join(sorted(olds)))

    changed = 0
    changed_files = []
    for path in files:
        with open(path, encoding="utf-8", newline="") as fh:
            text = fh.read()
        updated = text
        for old in olds:
            updated = updated.replace(old, new)
        if updated != text:
            changed += 1
            changed_files.append(path)
            print(f"{'[dry-run] ' if args.dry_run else ''}updated {path}")
            if not args.dry_run:
                with open(path, "w", encoding="utf-8", newline="") as fh:
                    fh.write(updated)
    print(f"{changed} file(s) {'would be ' if args.dry_run else ''}changed.")

    if args.dry_run or args.no_commit or not changed_files:
        return
    git_commit_and_push(args, changed_files, olds, new)


if __name__ == "__main__":
    main()
