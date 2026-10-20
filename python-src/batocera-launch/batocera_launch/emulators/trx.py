# This file is part of The Batocera Linux Distribution (https://batocera.org).
# Copyright (c) 2026 The Batocera Team.
#
# The Batocera Linux Distribution is free software: you can redistribute it
# and/or modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# The Batocera Linux Distribution is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with The Batocera Linux Distribution. If not, see
# <https://www.gnu.org/licenses/>.
#
# YOU MUST RETAIN THE LICENSE AND COPYRIGHT NOTICES ABOVE IN ANY
# REDISTRIBUTED VERSION OF THIS FILE.

from __future__ import annotations

import json
import logging
import shutil
from pathlib import Path
from typing import Any, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_logger = logging.getLogger(__name__)

_TRX_SRC: Final = Path('/usr/bin/trx')
_DEFAULT_MOD: Final = 'tr1'

_VALID_MODS: Final = {
    'trx1',
    'tr1',
    'tr1-ub',
    'tr1-demo-pc',
    'tr1-level',
    'tr2',
    'tr2-gm',
    'tr2-level',
    'tr3',
    'tr3-la',
    'tr3-level',
}

_EXPANSION_MODS: Final[dict[str, str]] = {'.trx1': 'tr1-ub', '.trx2': 'tr2-gm', '.trx3': 'tr3-la'}
_BASE_MODS: Final[dict[str, str]] = {'.trx1': 'tr1', '.trx2': 'tr2', '.trx3': 'tr3'}


def _copy_item(item: Path, dest: Path, /) -> None:
    if not item.is_dir():
        shutil.copy2(item, dest)
    elif not dest.exists():
        shutil.copytree(item, dest, dirs_exist_ok=True)
    else:
        for sub_item in item.rglob('*'):
            sub_dest = dest / sub_item.relative_to(item)
            if sub_item.is_dir():
                sub_dest.mkdir(parents=True, exist_ok=True)
            else:
                shutil.copy2(sub_item, sub_dest)


def _copy_shared_files(source: Path, rom_dir: Path, /) -> None:
    """Copy shared package configurations, shaders, etc. next to the game."""
    for item in source.iterdir():
        dest = rom_dir / item.name
        try:
            _copy_item(item, dest)
        except PermissionError as e:
            _logger.debug('Permission error while copying %s -> %s: %s', item, dest, e)
        except Exception as e:
            _logger.debug('Error copying %s -> %s: %s', item, dest, e)


def _engine_version(mod: str, /) -> str:
    return mod[2] if len(mod) > 2 and mod[2].isdigit() else '1'


@cached_dataclass
class TRX(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'trx',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4'], 'save_state': 'KEY_F5', 'restore_state': 'KEY_F6'},
        }

    @cached_property
    def in_game_ratio(self) -> float:
        return 16 / 9 if self.resolution.width / self.resolution.height > ((16.0 / 9.0) - 0.1) else 4 / 3

    @cached_property
    def mod(self) -> str:
        # Detect the mod from the launcher file's parent folder
        mod = self.rom.parent.name if self.rom.parent.name in _VALID_MODS else _DEFAULT_MOD
        mods = _EXPANSION_MODS if self.config.get_bool('trx-expansion') else _BASE_MODS
        return mods.get(self.rom.suffix, mod)

    async def configure(self) -> Command:
        rom_dir = self.rom.parent

        _copy_shared_files(_TRX_SRC, rom_dir)

        trx_bin = rom_dir / 'TRX'
        if trx_bin.exists():
            trx_bin.chmod(0o755)

        # Each engine (TR1/TR2/TR3) keeps its own settings file, named TR<N>X.json5
        await self._write_config(rom_dir / 'cfg' / f'TR{_engine_version(self.mod)}X.json5')

        return Command([trx_bin, '--mod', self.mod], {'SDL_JOYSTICK_HIDAPI': '0'})

    async def _write_config(self, config_file: Path, /) -> None:
        config_file.parent.mkdir(parents=True, exist_ok=True)
        config_data: dict[str, Any] = {}

        if config_file.exists():
            try:
                config_data = json.loads(config_file.read_text(encoding='utf-8'))
            except json.JSONDecodeError:
                _logger.debug('Invalid JSON format in %s, overwriting with default settings.', config_file)

        config_data.update({'is_fullscreen': True, 'width': self.resolution.width, 'height': self.resolution.height})
        config_file.write_text(json.dumps(config_data, indent=2), encoding='utf-8')
