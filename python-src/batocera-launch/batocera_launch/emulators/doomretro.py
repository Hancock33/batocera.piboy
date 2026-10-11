from __future__ import annotations

import shlex
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CONFIGS, ROMS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext

_DOOMRETRO_BIN: Final = Path('/usr/bin/doomretro')
_WAD_DIR: Final = ROMS / 'ports' / 'doom'


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
        args: list[str | Path] = [_DOOMRETRO_BIN]

        if self.rom.suffix in {'.uzdoom', '.uwad'}:
            args.extend(shlex.split(self.rom.read_text()))
        else:
            args.extend(['-iwad', self.rom.name])

        return Command(
            args,
            env={
                'DOOMWADDIR': _WAD_DIR,
                'XDG_CONFIG_HOME': CONFIGS,
                'XDG_DATA_HOME': SAVES,
            },
        )
