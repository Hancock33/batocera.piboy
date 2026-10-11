from __future__ import annotations

from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_LIBRARY_PATH: Final = '/lib:/usr/lib:/usr/lib/vcmi:/usr/lib/vcmi/AI'


@cached_dataclass
class Vcmi(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'vcmiclient',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['vcmiclient'],
            env={'LD_LIBRARY_PATH': _LIBRARY_PATH},
        )
