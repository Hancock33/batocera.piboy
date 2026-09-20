from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import BatoceraException, Command, Emulator, HotkeysContext

_ROM_DIR: Final = Path('/userdata/roms/ports/quake2')
_SOURCE_DIR: Final = Path('/usr/bin/vkquake2')


@cached_dataclass
class VKQuake2(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'vkquake2',
            'keys': {'exit': 'KEY_F10', 'save_state': 'KEY_F6', 'restore_state': 'KEY_F7'},
        }

    @property
    def execution_path(self) -> Path | None:
        return _ROM_DIR

    @cached_property
    def in_game_ratio(self) -> float:
        return 16 / 9 if self.resolution.width / self.resolution.height > ((16.0 / 9.0) - 0.1) else 4 / 3

    async def configure(self) -> Command:
        if not _SOURCE_DIR.exists():
            raise BatoceraException(f'Source directory {_SOURCE_DIR} does not exist.')

        shutil.copytree(_SOURCE_DIR, _ROM_DIR, dirs_exist_ok=True, copy_function=shutil.copy2)

        args: list[str | Path] = ['/userdata/roms/ports/quake2/quake2', '-datadir', '/userdata/roms/ports/quake2']

        if 'zero' in self.rom.name.lower():
            args.extend(['+set', 'game', 'rogue'])
        if 'reckoning' in self.rom.name.lower():
            args.extend(['+set', 'game', 'xatrix'])
        if 'zaero' in self.rom.name.lower():
            args.extend(['+set', 'game', 'zaero'])
        if 'destruction' in self.rom.name.lower():
            args.extend(['+set', 'game', 'smd'])

        return Command(args, env={'SDL_JOYSTICK_HIDAPI': '0'})
