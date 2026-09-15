from __future__ import annotations

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Srb2kart(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'srb2kart',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['srb2kart', self.rom],
            env={
                'SRB2WADDIR': '/userdata/roms/ports/srb2kart',
            },
        )
