from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path


@cached_dataclass
class Voidsw(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'voidsw',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return self.rom.parent

    async def configure(self) -> Command:

        addon = '-addon0'
        if 'WD' in self.rom.stem:
            addon = '-addon1'

        if 'TD' in self.rom.stem:
            addon = '-addon2'

        return Command(
            ['voidsw', '-j', addon, self.rom.parent],
            env={
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )
