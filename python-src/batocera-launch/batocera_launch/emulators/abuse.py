from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import SAVES
from batocera_launch import Command, Emulator, HotkeysContext

_ABUSE_BIN: Final = Path('/usr/bin/abuse')
_ROMS: Final = Path('/userdata/roms/ports/abuse')
_SAVES: Final = SAVES / 'abuse'


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
            [_ABUSE_BIN],
            env={
                'ABUSE_PATH': _ROMS,
                'ABUSE_SAVE_PATH': _SAVES,
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )
