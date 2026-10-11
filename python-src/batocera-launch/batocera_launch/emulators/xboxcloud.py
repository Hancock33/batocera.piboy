from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_GREENLIGHT_BIN: Final = Path('/usr/bin/greenlight')


@cached_dataclass
class XboxCloud(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'greenlight',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            [_GREENLIGHT_BIN, '--no-sandbox', '--fullscreen'],
            env={'SDL_JOYSTICK_HIDAPI': '0'},
        )
