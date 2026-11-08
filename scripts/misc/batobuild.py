#!/usr/bin/env python3
"""batobuild - build and clean helper for the Batocera tree (batocera.se).

    batobuild                          interactive menu
    batobuild build image              build images; asks RPI / X86
    batobuild build sub                build subsystems only
    batobuild build all --rpi --x86    subsystems, then images
    batobuild clean image              remove .stamp*_installed for all packages
    batobuild clean image --deep       remove source folder for all packages
    batobuild clean sub                remove .stamp*_installed for all packages
    batobuild clean sub --deep         remove source folder for all packages
    batobuild tidy                     drop superseded package builds/downloads
    batobuild mame [--rpi] [--x86] [--libretro]   build MAME
    batobuild remove-wine              remove Wine packages (x86)
    batobuild kernel                   delete kernel packages

Add -n/--dry-run to any command to see what would happen without doing it.

Paths can be overridden with BATO_REPO, BATO_BUILD_DIR and BATO_DL_DIR.
"""
from __future__ import annotations

import argparse
import os
import re
import shlex
import shutil
import subprocess
import sys
import time
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Iterable

HOME = Path.home()
REPO = Path(os.environ.get("BATO_REPO", HOME / "batocera.se"))
BUILD_ROOT = Path(os.environ.get("BATO_BUILD_DIR", HOME / "build-dir"))
DL_DIR = Path(os.environ.get("BATO_DL_DIR", HOME / "dl"))


# --------------------------------------------------------------------------
# Terminal output
# --------------------------------------------------------------------------
USE_COLOR = sys.stdout.isatty() and "NO_COLOR" not in os.environ


def paint(text: str, code: str) -> str:
    return f"\033[{code}m{text}\033[0m" if USE_COLOR else text


def bold(t): return paint(t, "1")
def dim(t): return paint(t, "2")
def red(t): return paint(t, "1;31")
def green(t): return paint(t, "1;32")
def yellow(t): return paint(t, "1;33")
def blue(t): return paint(t, "1;34")


@contextmanager
def background(code: str):
    """Tint the terminal background while a build runs, always reset after."""
    if USE_COLOR:
        print(f"\033[{code}m", end="", flush=True)
    try:
        yield
    finally:
        if USE_COLOR:
            print("\033[0m", end="", flush=True)


def banner(title: str) -> None:
    line = "─" * 52
    print(f"\n{blue(line)}\n{blue(' ' + title)}\n{blue(line)}")


def step(msg: str) -> None:
    print(f"{bold('›')} {msg}")


def info(msg: str) -> None:
    print(dim(f"  {msg}"))


def warn(msg: str) -> None:
    print(yellow(f"! {msg}"))


def fail(msg: str, code: int = 1):
    print(red(f"✘ {msg}"), file=sys.stderr)
    raise SystemExit(code)


def human(n: float) -> str:
    for unit in ("B", "KiB", "MiB", "GiB"):
        if n < 1024:
            return f"{n:.0f} {unit}" if unit == "B" else f"{n:.1f} {unit}"
        n /= 1024
    return f"{n:.1f} TiB"


def duration(secs: float) -> str:
    m, s = divmod(int(secs), 60)
    h, m = divmod(m, 60)
    return f"{h}h {m:02d}m {s:02d}s" if h else f"{m}m {s:02d}s"


def ask(question: str, default: bool = False) -> bool:
    """y/n prompt. Non-interactive sessions get the default."""
    if not sys.stdin.isatty():
        return default
    hint = "Y/n" if default else "y/N"
    while True:
        try:
            answer = input(f"{bold('?')} {question} [{hint}] ").strip().lower()
        except EOFError:
            return default
        if not answer:
            return default
        if answer in ("y", "yes"):
            return True
        if answer in ("n", "no"):
            return False


# --------------------------------------------------------------------------
# Targets
# --------------------------------------------------------------------------
@dataclass(frozen=True)
class Target:
    name: str      # build dir is ~/build-dir/batocera.<name>
    config: str    # board config passed to build.sh
    kind: str      # "image" or "sub" (subsystem)
    arch: str      # "rpi" or "x86"
    color: str     # ANSI code, used for headings only

    @property
    def path(self) -> Path:
        return BUILD_ROOT / f"batocera.{self.name}"

    @property
    def build(self) -> Path:
        return self.path / "build"

    @property
    def bg(self) -> str:
        """Background code matching the colour: "1;32" -> "1;42"."""
        return self.color.replace(";3", ";4")

    def label(self) -> str:
        return paint(self.name, self.color)


# Order matters: subsystems build before images, x86 before rpi.
TARGETS = (
    Target("x86_wow64", "x86_wow64", "sub", "x86", "1;32"),
    Target("aarch32", "aarch32-subsystem", "sub", "rpi", "1;33"),
    Target("x86_64", "x86_64", "image", "x86", "1;36"),
    Target("rpi4", "piboy4", "image", "rpi", "1;31"),
)
ARCH_NAMES = {"rpi": "Raspberry Pi4",
              "x86": "X86_64"}


# --------------------------------------------------------------------------
# What gets removed
# --------------------------------------------------------------------------
OUTPUT_DIRS = ("host", "images", "staging", "target", "target2")
STAMPS = "*/.stamp*_installed"

# Always removed before a build so stale Batocera packages get rebuilt.
PRECLEAN = (
    "host-batocera*", "batocera-launch*", "batocera-system*", "batocera-splash*",
    "batocera-es-system*", "batocera-configgen*", "batocera-desktopapps*",
    "batocera-scripts*", "python-batocera-common*", "hotkey*",
)
PRECLEAN_ALL = ("batocera-*", "host-batocera-*")

# Light clean: selected package sources only.
BASE_LIGHT = (
    "host-skeleton*", "host-gcc-final-*/.stamp_built", "gcc-final-*",
    "host-libopenssl*", "mesa3d*", "host-mesa3d*", "glibc-*",
)
IMAGE_LIGHT = BASE_LIGHT + (
    "batocera-*", "gobject-introspection*", "host-perl-parse-yapp-*",
    "mupen64plus-core*", "openmsx*", "libretro-core-info*",
    "libretro-duckstation*", "redream-*", "scummvm-*",
    "adwaita-icon-theme-light*", "*firmware*",
)
ARCH_EXTRA = {
    "rpi": ("lib32bit-*",),
    "x86": ("syslinux*", "xbox-xcloud-client*", "wine-x86-*"),
}

# Deep clean: every package dir except host-* / llvm-* (kept to save hours),
# plus a few host leftovers that must be rebuilt anyway.
DEEP_KEEP_PREFIXES = ("host", "llvm-")
DEEP_LEFTOVERS = (
    "host-skeleton*", "host-gcc-final-*/.stamp_built",
    "host-libopenssl*", "host-perl-parse-yapp*",
)

# "foo-1.2.3" -> "foo"; also "foo-1a2b3c4" (git hash). Needs at least one digit.
VERSION_SUFFIX = re.compile(r"-(?=[0-9a-f.]*\d)[0-9a-f.]+$")
# "foo-bar-1.2.3.tar.gz" -> "foo-bar"; also "-v1.2", "-<git hash>".
ARCHIVE_SUFFIX = re.compile(
    r"-(?:v?\d[^/]*?|[0-9a-f]{7,40})(?:\.zip|\.tar\.[a-z0-9]+)$"
)


def expand(base: Path, patterns: Iterable[str]) -> list[Path]:
    """Glob several patterns under base, de-duplicated, order preserved."""
    seen: dict[Path, None] = {}
    if base.is_dir():
        for pattern in patterns:
            for p in sorted(base.glob(pattern)):
                seen.setdefault(p)
    return list(seen)


def light_patterns(t: Target) -> tuple[str, ...]:
    if t.kind == "sub":
        return BASE_LIGHT
    return IMAGE_LIGHT + ARCH_EXTRA[t.arch]


def deep_sources(t: Target) -> list[Path]:
    if not t.build.is_dir():
        return []
    return [p for p in sorted(t.build.iterdir())
            if p.is_dir() and not p.is_symlink()
            and not p.name.startswith(DEEP_KEEP_PREFIXES)]


def stale_duplicates(paths: Iterable[Path], key: Callable[[Path], object]) -> list[Path]:
    """Of each group sharing a key, return everything but the newest."""
    groups: dict[object, list[Path]] = {}
    for p in paths:
        groups.setdefault(key(p), []).append(p)
    stale: list[Path] = []
    for items in groups.values():
        if len(items) > 1:
            items.sort(key=lambda p: p.stat().st_mtime, reverse=True)
            stale.extend(items[1:])
    return stale


def disk_usage(path: Path) -> int:
    if path.is_symlink() or path.is_file():
        return path.lstat().st_size
    total = 0
    for root, _dirs, files in os.walk(path, onerror=lambda _e: None):
        for name in files:
            try:
                total += os.lstat(os.path.join(root, name)).st_size
            except OSError:
                pass
    return total


# --------------------------------------------------------------------------
# Session: everything that touches the disk or runs a command
# --------------------------------------------------------------------------
class Session:
    def __init__(self, dry_run: bool = False):
        self.dry_run = dry_run
        self.freed = 0
        self._planned: set[Path] = set()

    # -- removal -----------------------------------------------------------
    def remove(self, path: Path) -> bool:
        if not (path.exists() or path.is_symlink()):
            return False
        if self.dry_run:
            if path in self._planned:  # already counted by an earlier step
                return False
            self._planned.add(path)
        self.freed += disk_usage(path)
        if self.dry_run:
            return True
        try:
            if path.is_dir() and not path.is_symlink():
                shutil.rmtree(path)
            else:
                path.unlink()
        except FileNotFoundError:
            pass
        except OSError:  # typically root-owned files left by a sudo build
            subprocess.run(["sudo", "rm", "-rf", str(path)], check=False)
        return True

    def purge(self, label: str, paths: Iterable[Path]) -> None:
        paths = list(paths)
        before = self.freed
        removed = [p for p in paths if self.remove(p)]
        if not removed:
            info(f"{label}: nothing to remove")
            return
        verb = "would remove" if self.dry_run else "removed"
        info(f"{label}: {verb} {len(removed)} item(s), {human(self.freed - before)}")
        if self.dry_run:
            for p in removed[:15]:
                info(f"  - {p}")
            if len(removed) > 15:
                info(f"  … and {len(removed) - 15} more")

    # -- commands ----------------------------------------------------------
    def run(self, cmd: list[str], *, cwd: Path, env: dict | None = None,
            quiet: bool = False) -> int:
        if self.dry_run:
            info("$ " + shlex.join(cmd))
            return 0
        try:
            if quiet:
                proc = subprocess.run(cmd, cwd=cwd, env=env, text=True,
                                      stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                if proc.returncode:
                    tail = "\n".join(proc.stdout.strip().splitlines()[-15:])
                    print(dim(tail))
                return proc.returncode
            return subprocess.run(cmd, cwd=cwd, env=env).returncode
        except FileNotFoundError as exc:
            print(red(f"  cannot run {cmd[0]}: {exc}"))
            return 127

    def sync_repo(self) -> None:
        step("Updating batocera.se and submodules")
        if not REPO.is_dir():
            fail(f"{REPO} not found (set BATO_REPO to override)")
        for cmd in (["git", "pull"], ["git", "submodule", "update", "--init"]):
            if self.run(cmd, cwd=REPO):
                fail(f"`{' '.join(cmd)}` failed")

    def configure(self, targets: Iterable[Target]) -> None:
        for t in targets:
            rc = self.run(["./build.sh", str(t.path), t.config], cwd=REPO, quiet=True)
            if rc:
                fail(f"configuring {t.name} failed (build.sh exit {rc})")
            step(f"Configured {t.label()} ({t.config})")


def brmake_command(*args: str) -> list[str]:
    """brmake is often a shell function in ~/.bashrc rather than a binary."""
    exe = shutil.which("brmake")
    if exe:
        return [exe, *args]
    return ["bash", "-ic", shlex.join(["brmake", *args])]


# --------------------------------------------------------------------------
# Selection helpers
# --------------------------------------------------------------------------
def pick_archs(args: argparse.Namespace, verb: str) -> set[str]:
    if args.all:
        return {"rpi", "x86"}
    archs = {a for a in ("rpi", "x86") if getattr(args, a)}
    if archs:
        return archs
    for arch in ("rpi", "x86"):
        if ask(f"{verb} {ARCH_NAMES[arch]}?"):
            archs.add(arch)
    return archs


BUILD_CHOICES = (
    ("image", "Build images only (no subsystems)"),
    ("sub", "Build subsystems only"),
    ("all", "Build both (subsystems, then images)"),
)


def pick_build_kind() -> str:
    """Ask 1/2/3 when `build` is run without saying what to build."""
    if not sys.stdin.isatty():
        return "image"
    for i, (_kind, label) in enumerate(BUILD_CHOICES, 1):
        print(f"  {bold(str(i))}. {label}")
    while True:
        try:
            choice = input(f"{bold('?')} Choose [1]: ").strip() or "1"
        except EOFError:
            return "image"
        if choice.isdigit() and 1 <= int(choice) <= len(BUILD_CHOICES):
            return BUILD_CHOICES[int(choice) - 1][0]


def choose(flag: bool | None, question: str, default: bool = False) -> bool:
    return flag if flag is not None else ask(question, default)


# --------------------------------------------------------------------------
# Commands
# --------------------------------------------------------------------------
def cmd_build(s: Session, a: argparse.Namespace) -> int:
    what = a.what or pick_build_kind()
    banner({"image": "Building Batocera images",
            "sub": "Building Batocera subsystems",
            "all": "Building Batocera subsystems + images"}[what])
    archs = pick_archs(a, "Build")
    if not archs:
        fail("Nothing selected - pass --rpi and/or --x86 (or --all).", 2)
    full_clean = choose(a.clean_packages, "Clean ALL Batocera packages first?")

    configured = [t for t in TARGETS if t.arch in archs]
    chosen = [t for t in configured if what == "all" or t.kind == what]
    print(f"\nPlan: {', '.join(t.label() for t in chosen)}"
          + (dim("  (dry run)") if s.dry_run else ""))

    if not a.no_sync:
        s.sync_repo()
    s.configure(chosen)

    step("Removing stale Batocera packages")
    patterns = PRECLEAN_ALL if full_clean else PRECLEAN
    for t in chosen:
        s.purge(t.name, expand(t.build, patterns))

    results: list[tuple[Target, int, float]] = []
    for t in chosen:
        banner(f"Building {t.name}")
        if a.wipe_tmp and t.kind == "image":
            step("Clearing /tmp")
            s.run(["sudo", "sh", "-c", "rm -rf /tmp/*"], cwd=HOME)
        started = time.monotonic()
        env = {**os.environ, "CONFIG_SHELL": "/bin/bash"}
        with background(t.bg):
            rc = s.run(brmake_command(), cwd=t.path, env=env)
        results.append((t, rc, time.monotonic() - started))
        if rc and not a.keep_going:
            warn(f"{t.name} failed (exit {rc}) - stopping (--no-keep-going).")
            break

    if not a.no_tidy:
        tidy(s, chosen)

    banner("Summary")
    for t, rc, secs in results:
        mark = green("✔") if rc == 0 else red("✘")
        print(f" {mark} {t.name:<12} {duration(secs)}")
    return 1 if any(rc for _t, rc, _s in results) else 0


def cmd_clean(s: Session, a: argparse.Namespace) -> int:
    kind = a.what
    deep = a.deep
    title = ("Deep cleaning" if deep else "Cleaning") + (
        " Batocera images" if kind == "image" else " Batocera subsystems")
    banner(title)
    archs = pick_archs(a, "Clean")
    if not archs:
        fail("Nothing selected - pass --rpi and/or --x86 (or --all).", 2)
    targets = [t for t in TARGETS if t.kind == kind and t.arch in archs]

    if not a.no_sync:
        s.sync_repo()
    s.configure(targets)

    for t in targets:
        print()
        step(f"Cleaning {t.label()}" + (" (deep)" if deep else ""))
        if not t.path.is_dir():
            warn("no build directory yet - skipped")
            continue
        s.purge("output directories", [t.path / d for d in OUTPUT_DIRS])
        if deep:
            s.purge("package sources", deep_sources(t))
            s.purge("host leftovers", expand(t.build, DEEP_LEFTOVERS))
        else:
            s.purge("package sources", expand(t.build, light_patterns(t)))
        s.purge("install stamps", expand(t.build, [STAMPS]))

    verb = "Would free" if s.dry_run else "Freed"
    print(f"\n{green('✔')} {verb} {human(s.freed)}")
    return 0


def tidy(s: Session, targets: Iterable[Target] = TARGETS) -> None:
    """Keep only the newest version of each package build dir / download."""
    banner("Tidying superseded versions")
    for t in targets:
        if not t.build.is_dir():
            continue
        dirs = [p for p in t.build.iterdir() if p.is_dir() and not p.is_symlink()]
        stale = stale_duplicates(dirs, lambda p: VERSION_SUFFIX.sub("", p.name))
        s.purge(f"{t.name}: old package builds", stale)

    if DL_DIR.is_dir():
        archives = [p for pattern in ("*", "*/*") for p in DL_DIR.glob(pattern)
                    if p.is_file() and (p.suffix == ".zip" or ".tar." in p.name)]
        stale = stale_duplicates(
            archives, lambda p: (p.parent, ARCHIVE_SUFFIX.sub("", p.name)))
        s.purge("downloads: old archives", stale)
    verb = "Would free" if s.dry_run else "Freed"
    print(f"\n{green('✔')} {verb} {human(s.freed)} in total")


def cmd_tidy(s: Session, _a: argparse.Namespace) -> int:
    tidy(s)
    return 0


# --------------------------------------------------------------------------
# MAME, Wine and kernel helpers
# --------------------------------------------------------------------------
# Patterns relative to <target>/build/ for `kernel`.
KERNEL_PATTERNS = (
    "linux-custom*", "linux-6.*", "linux-7.*", "linux-headers*", "linux-backports*",
    "*-amd*", "*-nvidia*", "nvidia-*",
    "aic8800*", "ayaneo-platform*", "ayn-platform*", "batman-adv*",
    "cryptodev-linux*", "dahdi-linux*", "db9_gpio_rpi*", "dtbocfg*", "emlog*",
    "esp-hosted*", "falcosecurity-libs*", "fwts*", "gamecon_gpio_rpi*",
    "gcnano-binaries*", "guncon*", "hid-nx*", "hid-t150*", "hid-tmff2*",
    "igh-ethercat*", "kernel-module-imx-gpu-viv*", "libargtable2*", "logitech*",
    "lttng-modules*", "mali-driver*", "mdio-tools*", "new-lg4ff*",
    "nxp-mwifiex*", "openvmtools*", "owl-linux*", "r81*", "rk915*",
    "rocknix-joypad*", "rtl8*", "rtw88*", "ryzen*", "uwe5622*", "v4l2loopback*",
    "wilc-driver*", "wireguard-linux-compat*", "xone*", "xpadneo*",
    "xpad-noone*", "xr819-xradio*", "zfs*",
)
# image target + the subsystem that goes with it
KERNEL_PAIRS = {"rpi": ("rpi4", "aarch32"), "x86": ("x86_64", "x86_wow64")}


def target_named(name: str) -> Target:
    return next(t for t in TARGETS if t.name == name)


def package_names(keyword: str) -> list[str]:
    """Packages in the repo (by .mk file name) whose name contains keyword."""
    return sorted({p.stem for p in (REPO / "package").rglob("*.mk")
                   if keyword in p.stem})


def installed_files(t: Target, pkg_dir: Path) -> list[Path]:
    """Files a package put into target/, from buildroot's .files-list.txt."""
    try:
        lines = (pkg_dir / ".files-list.txt").read_text().splitlines()
    except OSError:
        return []
    out = []
    for line in lines:
        rel = line.partition(",")[2].strip()
        if rel.startswith("./") and ".." not in Path(rel).parts:
            out.append(t.path / "target" / rel[2:])
    return out


def remove_packages(s: Session, t: Target, pkgs: Iterable[str]) -> None:
    """Remove packages from a build tree: installed files, build dirs, stamps."""
    step(f"Removing packages from {t.label()}")
    patterns = [p for pkg in pkgs for p in (f"{pkg}-*", f"host-{pkg}-*")]
    dirs = [d for d in expand(t.build, patterns) if d.is_dir()]
    files = [f for d in dirs if not d.name.startswith("host-")
             for f in installed_files(t, d)]
    s.purge("installed files", files)
    s.purge("package build dirs", dirs)


def cmd_remove_wine(s: Session, a: argparse.Namespace) -> int:
    banner("Removing Wine packages")
    x86, wow = target_named("x86_64"), target_named("x86_wow64")
    if a.yes or ask("Clean Wine build for X86?"):
        pkgs = package_names("wine")
        if not pkgs:
            warn(f"no wine packages found under {REPO / 'package'}")
        for t in (x86, wow):
            remove_packages(s, t, pkgs)
        s.purge("wine leftovers",
                expand(x86.build, ["wine*", "batocera-wine*"])
                + [t.path / "target/usr/wine" for t in (x86, wow)])
    tidy(s, [wow, x86])
    return 0


def cmd_kernel(s: Session, a: argparse.Namespace) -> int:
    banner("Deleting Batocera kernel packages")
    archs = pick_archs(a, "Delete kernel packages for")
    if not archs:
        fail("Nothing selected - pass --rpi and/or --x86 (or --all).", 2)
    for arch in ("rpi", "x86"):
        if arch not in archs:
            continue
        primary, secondary = (target_named(n) for n in KERNEL_PAIRS[arch])
        print()
        step(f"Kernel packages: {primary.label()} + {secondary.label()}")
        s.purge(f"{primary.name}: kernel modules",
                expand(primary.path, ["target/lib/modules/7.*"]))
        for t in (primary, secondary):
            s.purge(f"{t.name}: kernel packages", expand(t.build, KERNEL_PATTERNS))
    verb = "Would free" if s.dry_run else "Freed"
    print(f"\n{green('✔')} {verb} {human(s.freed)}")
    return 0


def cmd_mame(s: Session, a: argparse.Namespace) -> int:
    banner("Building Batocera MAME")
    archs = pick_archs(a, "Build MAME for")
    if not archs:
        fail("Nothing selected - pass --rpi and/or --x86 (or --all).", 2)
    if a.libretro is not None:
        libretro = a.libretro
    elif a.rpi or a.x86 or a.all:
        libretro = False  # flags given: non-interactive, standalone only
    else:
        libretro = ask("Build libretro and standalone MAME?")
    packages = ["mame"] + (["libretro-mame"] if libretro else [])
    targets = [t for t in TARGETS if t.kind == "image" and t.arch in archs]

    failed: list[str] = []
    for t in targets:
        banner(f"Building MAME - {t.name}")
        if not s.dry_run and not t.path.is_dir():
            warn(f"missing build dir: {t.path}")
            failed.append(t.name)
            continue
        for pkg in packages:
            step(f"{pkg} ({t.label()})")
            with background(t.bg):
                rc = s.run(brmake_command(f"{pkg}-src"), cwd=t.path)
            if rc:
                failed.append(f"{t.name}/{pkg}")
    print()
    if failed:
        print(red(f"✘ Failed: {', '.join(failed)}"))
        return 1
    print(f"{green('✔')} All builds finished.")
    return 0


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------
MENU = (
    ("Build images", ["build", "image"]),
    ("Build subsystems", ["build", "sub"]),
    ("Build subsystems + images", ["build", "all"]),
    ("Build MAME", ["mame"]),
    ("Clean images", ["clean", "image"]),
    ("Clean images - deep (was complete-clean)", ["clean", "image", "--deep"]),
    ("Clean subsystems", ["clean", "sub"]),
    ("Clean subsystems - deep (was complete-clean-sub)", ["clean", "sub", "--deep"]),
    ("Tidy old package versions and downloads", ["tidy"]),
    ("Remove Wine packages (x86)", ["remove-wine"]),
    ("Delete kernel packages", ["kernel"]),
)


def menu() -> list[str]:
    banner("Batocera build tool")
    for i, (label, _argv) in enumerate(MENU, 1):
        print(f"  {bold(str(i))}. {label}")
    print(f"  {bold('q')}. Quit")
    while True:
        try:
            choice = input(f"\n{bold('?')} Choose: ").strip().lower()
        except EOFError:
            raise SystemExit(0)
        if choice in ("q", "quit", ""):
            raise SystemExit(0)
        if choice.isdigit() and 1 <= int(choice) <= len(MENU):
            return MENU[int(choice) - 1][1]


def add_common(p: argparse.ArgumentParser, sub: bool) -> None:
    d = argparse.SUPPRESS if sub else False  # lets flags work before or after the subcommand
    p.add_argument("-n", "--dry-run", action="store_true", default=d,
                   help="show what would be done, change nothing")
    p.add_argument("--no-sync", action="store_true", default=d,
                   help="skip git pull / submodule update")


def add_targets(p: argparse.ArgumentParser) -> None:
    g = p.add_argument_group("targets (omit to be asked)")
    g.add_argument("--rpi", action="store_true", help="Raspberry Pi: rpi4 + aarch32")
    g.add_argument("--x86", action="store_true", help="x86: x86_64 + x86_wow64")
    g.add_argument("--all", action="store_true", help="both")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="batobuild", description="Build and clean Batocera.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Run with no arguments for an interactive menu.")
    add_common(parser, sub=False)
    sp = parser.add_subparsers(dest="command")

    b = sp.add_parser("build", help="build images, subsystems, or both")
    add_common(b, sub=True)
    b.add_argument("what", nargs="?", choices=("image", "sub", "all"),
                   help="image, sub (subsystems only) or all (subsystems then images); "
                        "asked if omitted")
    add_targets(b)
    opt = argparse.BooleanOptionalAction
    b.add_argument("--clean-packages", action=opt, default=None,
                   help="wipe all batocera-* packages first (asked if omitted)")
    b.add_argument("--wipe-tmp", action="store_true",
                   help="sudo rm -rf /tmp/* before each image build (old default; "
                        "affects other programs, so now opt-in)")
    b.add_argument("--no-tidy", action="store_true",
                   help="skip the post-build removal of old versions")
    b.add_argument("--keep-going", action=opt, default=True,
                   help="continue with other targets if one fails (default); "
                        "--no-keep-going stops at the first failure")
    b.set_defaults(func=cmd_build)

    c = sp.add_parser("clean", help="clean build directories")
    add_common(c, sub=True)
    c.add_argument("what", choices=("image", "sub"), help="images or subsystems")
    c.add_argument("--deep", action="store_true",
                   help="remove every package dir except host-*/llvm-* "
                        "(the old complete-clean scripts)")
    add_targets(c)
    c.set_defaults(func=cmd_clean)

    t = sp.add_parser("tidy", help="remove superseded package builds and downloads")
    add_common(t, sub=True)
    t.set_defaults(func=cmd_tidy)

    m = sp.add_parser("mame", help="build standalone MAME (and optionally libretro-mame)")
    add_common(m, sub=True)
    add_targets(m)
    m.add_argument("--libretro", action=opt, default=None,
                   help="also build libretro-mame (asked if no targets are given)")
    m.set_defaults(func=cmd_mame)

    w = sp.add_parser("remove-wine", help="remove Wine packages from the x86 trees")
    add_common(w, sub=True)
    w.add_argument("-y", "--yes", action="store_true", help="don't ask for confirmation")
    w.set_defaults(func=cmd_remove_wine)

    k = sp.add_parser("kernel", help="delete kernel and kernel-module packages")
    add_common(k, sub=True)
    add_targets(k)
    k.set_defaults(func=cmd_kernel)
    return parser


def main(argv: list[str] | None = None) -> int:
    raw = sys.argv[1:] if argv is None else argv
    parser = build_parser()
    args = parser.parse_args(raw)
    if args.command is None:
        if not sys.stdin.isatty():
            parser.print_help()
            return 2
        args = parser.parse_args(raw + menu())
    session = Session(dry_run=args.dry_run)
    try:
        return args.func(session, args)
    except KeyboardInterrupt:
        print(red("\nInterrupted."))
        return 130


if __name__ == "__main__":
    sys.exit(main())
