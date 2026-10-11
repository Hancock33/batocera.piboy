from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

_DATA: Final = ROMS / 'ports' / 'avp'
_GLES_LIB: Final = Path('/usr/lib/libGLESv2.so')


@cached_dataclass
class Avp(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'avp',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['avp', '-f', '-p', f'{_DATA}/', '-g', _GLES_LIB],
            env={'SDL_JOYSTICK_HIDAPI': '0'},
        )
