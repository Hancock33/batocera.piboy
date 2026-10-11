from __future__ import annotations

from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext

_DATA: Final = ROMS / 'ports' / 'hode'
_SAVES: Final = SAVES / 'hode'


@cached_dataclass
class Hode(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'hode',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['hode', f'--datapath={_DATA}', f'--savepath={_SAVES}'],
            env={'SDL_JOYSTICK_HIDAPI': '0'},
        )
