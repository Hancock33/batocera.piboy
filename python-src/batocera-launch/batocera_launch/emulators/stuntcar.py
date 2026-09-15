from __future__ import annotations
import os

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Stuntcar(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'stuntcar',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        os.chdir('/usr/share/stuntcar')
        return Command(
            ['/usr/share/stuntcar/stuntcar', '-f'],
            env={
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )
