#!/usr/bin/env python3
"""
Build a clrmamepro DAT (Logiqx XML) from Keisho's games.xml.

Keisho's games.xml identifies ROMs by CRC32 only, while clrmamepro needs a
size for every ROM. Sizes (and SHA1s) are looked up by CRC in MAME's Sega
driver sources. A ROM that MAME doesn't know takes the size of the other chips
in the same region and gets no SHA1; these are reported as warnings.

Usage
  python build_keisho_dat.py games.xml
  python build_keisho_dat.py games.xml -o keisho_model2_model3.dat
  python build_keisho_dat.py games.xml --mame-src path/to/mame
  python build_keisho_dat.py games.xml --non-merged -o keisho_model2_model3_nonmerged.dat
  python build_keisho_dat.py games.xml --split -o keisho.dat   (keisho_model1.dat, _model2, _model3)

--mame-src takes a MAME source checkout (or any folder of driver .cpp files).
Without it, the script does a small sparse clone of the Sega drivers from
github.com/mamedev/mame into ./mame-src (needs git), and reuses that clone on
later runs. Pass --update-mame to pull the latest MAME sources first.

Exit status is 1 when a ROM's size can't be found or guessed.
"""

import argparse
import datetime
import re
import subprocess
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from xml.sax.saxutils import escape, quoteattr

MAME_REPO = "https://github.com/mamedev/mame"
SPARSE_PATHS = ["/src/mame/sega/", "/src/mame/shared/"]

# ROM_LOAD*, ROMX_LOAD, ROM_LOAD16_WORD_SWAP, ... ( "name", offset, size, [flags,] [BAD_DUMP] CRC(x) SHA1(y)
ROM_RE = re.compile(
    r'ROM\w*\(\s*"([^"]+)"\s*,\s*([^,]+),\s*([^,]+),\s*(?:[^,]*,\s*)?(?:BAD_DUMP\s*)?'
    r'CRC\(([0-9a-fA-F]+)\)\s*SHA1\(([0-9a-fA-F]+)\)'
)


def log(msg):
    print(msg, file=sys.stderr)


# --------------------------------------------------------------------------- MAME sources

def fetch_mame(dest: Path, update: bool) -> Path:
    if (dest / ".git").is_dir():
        if update:
            log(f"Updating MAME sources in {dest} ...")
            subprocess.run(["git", "-C", str(dest), "pull", "--depth", "1"], check=True)
        return dest
    log(f"Fetching MAME Sega drivers into {dest} (sparse clone) ...")
    subprocess.run(["git", "clone", "--depth", "1", "--filter=blob:none", "--sparse",
                    MAME_REPO, str(dest)], check=True)
    subprocess.run(["git", "-C", str(dest), "sparse-checkout", "set", "--no-cone", *SPARSE_PATHS],
                   check=True)
    return dest


def load_mame_sizes(src: Path):
    """CRC -> list of (size, sha1, lowercase name) from every .cpp under src."""
    sega = src / "src" / "mame"
    roots = [sega / "sega", sega / "shared"] if (sega / "sega").is_dir() else [src]
    table = {}
    files = 0
    for root in roots:
        for cpp in root.rglob("*.cpp"):
            files += 1
            for line in cpp.read_text(encoding="utf-8", errors="ignore").splitlines():
                for name, _off, size, crc, sha1 in ROM_RE.findall(line):
                    try:
                        size = int(size.strip(), 0)
                    except ValueError:
                        continue  # size given as a macro; skip
                    entry = (size, sha1.lower(), name.lower())
                    lst = table.setdefault(crc.lower().zfill(8), [])
                    if entry not in lst:
                        lst.append(entry)
    if not table:
        sys.exit(f"No ROM definitions found under {src}. Is that a MAME source folder?")
    log(f"Read {len(table)} ROM CRCs from {files} MAME source files.")
    return table


# --------------------------------------------------------------------------- games.xml

def parse_lenient(text, source="file"):
    """Parse XML, tolerating '--' inside comments and content outside a single root element."""
    text = text.lstrip("\ufeff")
    text = re.sub(r"<!--.*?-->", "", text, flags=re.S)
    try:
        return ET.fromstring(text.encode("utf-8"))
    except ET.ParseError as first:
        body = re.sub(r"<\?xml[^>]*\?>|<!DOCTYPE[^>]*>", "", text)
        try:
            return ET.fromstring(("<games>" + body + "</games>").encode("utf-8"))
        except ET.ParseError:
            pass
        # Last resort: read every <game> block on its own, ignoring whatever surrounds them.
        root, bad = ET.Element("games"), []
        for m in re.finditer(r"<game\b[^>]*?(?:/>|>.*?</game\s*>)", body, flags=re.S):
            try:
                root.append(ET.fromstring(m.group(0).encode("utf-8")))
            except ET.ParseError as err:
                bad.append((text.count("\n", 0, text.find(m.group(0))) + 1, err))
        if len(root):
            print(f"warning: {source} is not well-formed XML ({first}); read {len(root)} <game> "
                  f"blocks one at a time", file=sys.stderr)
            for ln, err in bad[:10]:
                print(f"warning: skipped a <game> block near line {ln}: {err}", file=sys.stderr)
            return root
        if True:
            lines = text.splitlines()
            ln = first.position[0]
            ctx = "\n".join(f"  {i}: {lines[i-1]}" for i in range(max(1, ln - 2), min(len(lines), ln + 2) + 1))
            sys.exit(f"{source}: XML error ({first}). After stripping comments the text around it is:\n{ctx}")

def norm_crc(value):
    return (value or "").lower().replace("0x", "").zfill(8)


def load_games(path: Path):
    root = parse_lenient(path.read_text(encoding="utf-8", errors="replace"), str(path))
    games = {}
    for g in root.iter("game"):
        name = g.get("name")
        if name in games:
            log(f"warning: duplicate set name {name}; keeping the first")
            continue
        games[name] = g
    return games


def inherited_text(games, g, tag):
    el = g.find(tag)
    if el is not None and el.text and el.text.strip():
        return el.text.strip()
    parent = g.get("parent")
    return inherited_text(games, games[parent], tag) if parent in games else ""


def board_family(games, g):
    """'model1', 'model2' (model2/2a/2b/2c) or 'model3', inherited from the parent when unset."""
    board = g.get("board")
    if not board and g.get("parent") in games:
        return board_family(games, games[g.get("parent")])
    m = re.match(r"(model\d)", board or "")
    return m.group(1) if m else (board or "unknown")


SYSTEM_NAMES = {"model1": "Sega Model 1", "model2": "Sega Model 2", "model3": "Sega Model 3"}


def regions(games, g):
    """Region name -> element, with a clone's regions replacing its parent's by name."""
    out = {}
    parent = g.get("parent")
    if parent in games:
        out.update(regions(games, games[parent]))
    for reg in g.findall("roms/region"):
        out[reg.get("name")] = reg
    return out


def rom_files(games, g):
    """List of (name, crc, region element), unique by (name, crc)."""
    res, seen = [], set()
    for reg in regions(games, g).values():
        for f in reg.findall("file"):
            crc = norm_crc(f.get("crc") or f.get("crc32"))
            key = (f.get("name"), crc)
            if key not in seen:
                seen.add(key)
                res.append((f.get("name"), crc, reg))
    return res


# --------------------------------------------------------------------------- build

def build(games, sizes, out_path: Path, version: str, non_merged: bool = False,
          system: str = "Sega Model 2 / Model 3", sets=None):
    warnings, missing = [], []
    lines = [
        '<?xml version="1.0"?>',
        '<!DOCTYPE datafile PUBLIC "-//Logiqx//DTD ROM Management Datafile//EN" '
        '"http://www.logiqx.com/Dats/datafile.dtd">',
        "<datafile>",
        "\t<header>",
        f"\t\t<name>Keisho - {system}{' (non-merged)' if non_merged else ''}</name>",
        f"\t\t<description>Keisho ROM database ({system}){', non-merged' if non_merged else ''}</description>",
        f"\t\t<version>{escape(version)}</version>",
        "\t\t<author>converted from Keisho games.xml</author>",
        f'\t\t<clrmamepro forcemerging="{"none" if non_merged else "split"}"/>',
        "\t</header>",
    ]
    rom_count = 0
    for name, g in games.items():
        if sets is not None and name not in sets:
            continue
        parent = g.get("parent")
        if parent and sets is not None and parent in games and parent not in sets:
            warnings.append(f"{name}: parent {parent} is on a different board; written as a parent set")
            parent = None
        if parent and parent not in games:
            warnings.append(f"{name}: parent {parent} is not in games.xml; written as a parent set")
            parent = None

        title = inherited_text(games, g, "title")
        version_txt = g.findtext("version", "").strip()
        desc = title + (f" ({version_txt})" if version_txt else "")

        attrs = f" name={quoteattr(name)}"
        if parent:
            attrs += f" cloneof={quoteattr(parent)}" + ("" if non_merged else f" romof={quoteattr(parent)}")
        lines.append(f"\t<game{attrs}>")
        lines.append(f"\t\t<description>{escape(desc or name)}</description>")
        lines.append(f"\t\t<year>{escape(inherited_text(games, g, 'year'))}</year>")
        lines.append(f"\t\t<manufacturer>{escape(inherited_text(games, g, 'manufacturer'))}</manufacturer>")

        parent_roms = {(n, c) for n, c, _ in rom_files(games, games[parent])} if parent and not non_merged else set()

        for rom_name, crc, reg in rom_files(games, g):
            merge = f" merge={quoteattr(rom_name)}" if (rom_name, crc) in parent_roms else ""
            known = sizes.get(crc)
            if known:
                by_name = [k for k in known if k[2] == rom_name.lower()]
                cands = sorted({(k[0], k[1]) for k in (by_name or known)})
                if len(cands) > 1:
                    warnings.append(f"{name}: {rom_name} has several MAME entries {cands}; using the first")
                size, sha1 = cands[0]
                lines.append(f'\t\t<rom name={quoteattr(rom_name)}{merge} size="{size}" crc="{crc}" sha1="{sha1}"/>')
            else:
                siblings = [sizes[norm_crc(f.get("crc") or f.get("crc32"))][0][0]
                            for f in reg.findall("file")
                            if norm_crc(f.get("crc") or f.get("crc32")) in sizes]
                if not siblings:
                    missing.append(f"{name}: {rom_name} crc {crc}")
                    continue
                size = siblings[0]
                warnings.append(f"{name}: {rom_name} ({crc}) not in MAME; size {hex(size)} taken from "
                                f"the other chips in region '{reg.get('name')}'")
                lines.append(f'\t\t<rom name={quoteattr(rom_name)}{merge} size="{size}" crc="{crc}"/>')
            rom_count += 1
        lines.append("\t</game>")
    lines.append("</datafile>")

    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    written = [n for n in games if sets is None or n in sets]
    clones = sum(1 for n in written if games[n].get("parent") in games)
    log(f"Wrote {out_path}: {len(written)} sets ({clones} clones), {rom_count} ROMs.")
    for w in warnings:
        log(f"warning: {w}")
    for m in missing:
        log(f"MISSING (no size, left out): {m}")
    return not missing


def main():
    ap = argparse.ArgumentParser(description="Build a clrmamepro DAT from Keisho's games.xml.")
    ap.add_argument("games_xml", type=Path, help="path to Keisho's games.xml")
    ap.add_argument("-o", "--output", type=Path, default=Path("keisho_model2_model3.dat"),
                    help="output DAT (default: keisho_model2_model3.dat)")
    ap.add_argument("--mame-src", type=Path,
                    help="MAME source checkout or folder of driver .cpp files "
                         "(default: sparse-clone into ./mame-src)")
    ap.add_argument("--update-mame", action="store_true", help="git pull the cached MAME clone first")
    ap.add_argument("--non-merged", action="store_true",
                    help="every set holds all of its ROMs, parents' included (no merge/romof)")
    ap.add_argument("--split", action="store_true",
                    help="write one DAT per system (model1, model2, model3) from each set's board=, "
                         "named <output>_model1.dat and so on")
    ap.add_argument("--version", default=datetime.date.today().isoformat(),
                    help="DAT version string (default: today's date)")
    args = ap.parse_args()

    src = args.mame_src or fetch_mame(Path("mame-src"), args.update_mame)
    sizes = load_mame_sizes(src)
    games = load_games(args.games_xml)
    if not args.split:
        ok = build(games, sizes, args.output, args.version, args.non_merged)
    else:
        families = {}
        for name, g in games.items():
            families.setdefault(board_family(games, g), set()).add(name)
        ok = True
        for fam in sorted(families):
            out = args.output.with_name(f"{args.output.stem}_{fam}{args.output.suffix or '.dat'}")
            ok &= build(games, sizes, out, args.version, args.non_merged,
                        SYSTEM_NAMES.get(fam, fam), families[fam])
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
