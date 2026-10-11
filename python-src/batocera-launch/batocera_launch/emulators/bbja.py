from __future__ import annotations

from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

_DATA: Final = ROMS / 'ports' / 'bbja'


@cached_dataclass
class Bbja(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'bbja',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['bbja', f'--datapath={_DATA}', '--fullscreen'],
            env={'SDL_JOYSTICK_HIDAPI': '0'},
        )
