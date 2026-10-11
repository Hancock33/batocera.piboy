from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

_ALEPHONE_BIN: Final = Path('/usr/bin/alephone')
_DATA: Final = ROMS / 'ports' / 'alephone'


@cached_dataclass
class Alephone(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'alephone',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        if 'marathon2' in self.rom.stem:
            scenario = _DATA / 'marathon2'
        elif 'infinity' in self.rom.stem:
            scenario = _DATA / 'infinity'
        else:
            scenario = _DATA / 'marathon'

        return Command([_ALEPHONE_BIN, scenario])
