from __future__ import annotations

import logging
import subprocess
from contextlib import contextmanager
from pathlib import Path
from typing import TYPE_CHECKING, Final

from ..batoceraPaths import mkdir_if_not_exists
from ..exceptions import BatoceraException

if TYPE_CHECKING:
    from collections.abc import Iterator

_logger = logging.getLogger(__name__)

_SQUASHFS_DIR: Final = Path("/var/run/squashfs/")


@contextmanager
def mount_squashfs(rom: Path, /) -> Iterator[Path]:
    _logger.debug("mount_squashfs(%s)", rom)
    mount_point = _SQUASHFS_DIR / rom.stem

    mkdir_if_not_exists(_SQUASHFS_DIR)

    # first, try to clean an empty remaining directory (for example because of a crash)
    if mount_point.exists() and mount_point.is_dir():
        _logger.debug("mount_squashfs: %s already exists", mount_point)
        # try to remove an empty directory, else, run the directory, ignoring the .squashfs
        try:
            mount_point.rmdir()
        except (FileNotFoundError, OSError):
            _logger.debug("mount_squashfs: failed to rmdir %s", mount_point)
            yield mount_point
            # No cleanup is necessary
            return

    # ok, the base directory doesn't exist, let's create it and mount the squashfs on it
    mount_point.mkdir()

    return_code = subprocess.call(["mount", rom, mount_point])
    if return_code != 0:
        _logger.debug("mount_squashfs: mounting %s failed", mount_point)
        try:
            mount_point.rmdir()
        except (FileNotFoundError, OSError):
            pass
        raise BatoceraException(f"Unable to mount the file {rom}")

    try:
        # if the squashfs contains a single file with the same name, take it as the rom file
        rom_single = mount_point / rom.stem
        rom_ps = mount_point / "PS3_GAME"
        if len(list(mount_point.iterdir())) == 1 and rom_single.exists():
            _logger.debug("squashfs: single rom %s", rom_single)
            yield str(rom_single)
        elif len(list(mount_point.iterdir())) == 1 and rom_ps.exists():
            _logger.debug("squashfs: ps3 rom %s", rom_ps)
            yield str(mount_point)
        elif "/bigfish/" in str(rom) or "/popcap/" in str(rom) or "/windows/" in str(rom):
            _logger.debug("squashfs: windows rom %s", mount_point)
            yield str(mount_point)
        else:
            try:
                rom_linked = (mount_point / ".ROM").resolve(strict=True)
            except OSError:
                yield mount_point
            else:
                _logger.debug("squashfs: linked rom %s", rom_linked)
                yield rom_linked
    finally:
        _logger.debug("mount_squashfs: cleaning up %s", mount_point)

        # unmount
        return_code = subprocess.call(["umount", mount_point])
        if return_code != 0:
            _logger.debug("mount_squashfs: unmounting %s failed", mount_point)
            raise BatoceraException(f"Unable to unmount the file {mount_point}")

        # cleaning the empty directory
        mount_point.rmdir()
