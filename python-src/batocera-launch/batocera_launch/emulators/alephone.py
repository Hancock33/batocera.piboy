from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path


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
        args: list[str | Path] = ['/usr/bin/alephone']

        if 'marathon2' in self.rom.stem:
            args.append('/userdata/roms/ports/alephone/marathon2')
        elif 'infinity' in self.rom.stem:
            args.append('/userdata/roms/ports/alephone/infinity')
        else:
            args.append('/userdata/roms/ports/alephone/marathon')

        return Command(
            args,
        )
