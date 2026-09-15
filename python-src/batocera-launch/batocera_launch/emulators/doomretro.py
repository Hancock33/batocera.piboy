from __future__ import annotations

import shlex
from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CONFIGS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path

@cached_dataclass
class Doomretro(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'doomretro',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4'], 'save_store': 'KEY_F6', 'restore_store': 'KEY_F9'},
        }

    async def configure(self) -> Command:

        args: list[str | Path] = ['/usr/bin/doomretro']

        if self.rom.suffix == '.uzdoom' or self.rom.suffix == '.uwad':
            args.extend(shlex.split(self.rom.read_text()))
        else:
            args.extend(['-iwad', self.rom.name])

        return Command(
            args,
            env={
                'DOOMWADDIR': '/userdata/roms/ports/doom',
                'XDG_CONFIG_HOME': CONFIGS,
                'XDG_DATA_HOME': SAVES,
            },
        )
