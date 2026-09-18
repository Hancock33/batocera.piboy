from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path


@cached_dataclass
class Nesbox(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'nesbox',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @cached_property
    def in_game_ratio(self) -> float:
        return 16 / 9

    async def configure(self) -> Command:

        args: list[str | Path] = ['tic80']

        commandArray = ['tic80']
        rombase = self.rom.stem

        if (rombase.lower() == 'surf' or rombase.lower() == 'console'):
            args.append('--cmd=surf')
        else:
            commandArray.extend(self.rom)

        return Command(
            args,
        )
