from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_TYRIAN_DATA: Final = Path('/usr/share/opentyrian/data')
_TYRIAN2000_DATA: Final = Path('/usr/share/tyrian2000')


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
            return Command(['opentyrian2000', f'-t{_TYRIAN2000_DATA}/', '-j'])

        return Command(['opentyrian', f'-t{_TYRIAN_DATA}/', '-j'])
