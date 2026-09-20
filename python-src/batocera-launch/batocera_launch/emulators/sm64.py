from __future__ import annotations

import os
from pathlib import Path

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

REGION_CONFIG = {
    '.e64': {'binary': 'sm64.eu', 'savedir': '/userdata/saves/sm64/eu'},
    '.j64': {'binary': 'sm64.jp', 'savedir': '/userdata/saves/sm64/jp'},
    '.u64': {'binary': 'sm64.us', 'savedir': '/userdata/saves/sm64/us'},
}


@cached_dataclass
class Sm64(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'sm64',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return self.rom

    async def configure(self) -> Command:
        extension = self.rom.suffix.lower() if len(self.rom.suffix.lower()) >= 3 else '.e64'
        region = REGION_CONFIG.get(extension, REGION_CONFIG['.e64'])

        savedir = Path(region['savedir'])
        savedir.mkdir(parents=True, exist_ok=True)

        args: list[str | Path] = [(region['binary']), '--gamedir', './', '--savepath', savedir]

        # Skip Intro
        if self.config.get_bool('nointro'):
            args.append('--skip-intro')

        # Cheat Menu
        if self.config.get_bool('cheatsmenu'):
            args.append('--cheats')

        return Command(
            args,
        )
