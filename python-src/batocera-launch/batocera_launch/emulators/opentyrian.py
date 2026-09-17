from __future__ import annotations

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Tyrian(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'tyrian',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @cached_property
    def in_game_ratio(self) -> float:
        return 16 / 9

    async def configure(self) -> Command:
        if '2000' in self.rom.name:
            return Command(['opentyrian2000', '-t/usr/share/tyrian2000/', '-j'])
        return Command(['opentyrian', '-t/usr/share/opentyrian/data/', '-j'])
