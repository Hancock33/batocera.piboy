from __future__ import annotations

from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Abuse(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'abuse',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['/usr/bin/abuse'],
            env={
                'ABUSE_PATH': '/userdata/roms/ports/abuse',
                'ABUSE_SAVE_PATH': '/userdata/saves/abuse',
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )
