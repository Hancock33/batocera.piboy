from __future__ import annotations

import os

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Serioussam(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'serioussam',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:

        if '/samtfe/' in str(self.rom).lower():
            data_dir = '/usr/share/game_assets/samtfe/Bin'
        else:
            data_dir = '/usr/share/game_assets/samtse/Bin'

        os.chdir(data_dir)

        return Command(
            [f'{data_dir}/serioussam'],
            env={'LD_LIBRARY_PATH': f'/usr/lib:/lib:{data_dir}'},
        )
