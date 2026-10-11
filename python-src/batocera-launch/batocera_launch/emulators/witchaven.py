from __future__ import annotations

import os
from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path

_DATA: Final = ROMS / 'ports' / 'witchaven'


@cached_dataclass
class Witchaven(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'ewitchaven',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return self.rom.parent

    async def configure(self) -> Command:
        os.chdir(_DATA)

        return Command(
            ['ewitchaven'],
            env={'SDL_JOYSTICK_HIDAPI': '0'},
        )
