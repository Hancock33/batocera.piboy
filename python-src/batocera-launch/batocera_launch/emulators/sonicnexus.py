from __future__ import annotations

import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import (
    Command,
    Emulator,
    HotkeysContext,
)

_BINARY_SRC: Final = Path('/usr/bin/sonicnexus')


@cached_dataclass
class SonicNexus(Emulator):
    needs_sdl_game_controller_config = True
    needs_sdl_controller_db = True

    @cached_property
    def sdl_controller_db_path(self) -> Path:
        return self.roms_dir / 'gamecontrollerdb.txt'

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'sonicnexus',
            'keys': {
                'exit': ['KEY_LEFTALT', 'KEY_F4'],
                'menu': 'KEY_ENTER',
                'pause': 'KEY_ENTER',
            },
        }

    @cached_property
    def roms_dir(self) -> Path:
        return ROMS / 'ports' / 'sonicnexus'

    @property
    def execution_path(self) -> Path | None:
        return self.roms_dir

    @cached_property
    def in_game_ratio(self) -> float:
        return 16 / 9

    async def configure(self) -> Command:
        destination_file = self.roms_dir / 'sonicnexus'
        shutil.copy(_BINARY_SRC, destination_file)

        return Command(
            [destination_file],
            env={'SDL_JOYSTICK_HIDAPI': '0'},
        )
