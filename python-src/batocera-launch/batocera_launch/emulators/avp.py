from __future__ import annotations

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


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
            ['avp', '-f', '-p', '/userdata/roms/ports/avp/', '-g', '/usr/lib/libGLESv2.so'],
            env={
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )
