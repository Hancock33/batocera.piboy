from __future__ import annotations

import os
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_ASSETS: Final = Path('/usr/share/game_assets')


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
            data_dir = _ASSETS / 'samtfe' / 'Bin'
        else:
            data_dir = _ASSETS / 'samtse' / 'Bin'

        os.chdir(data_dir)

        return Command(
            [data_dir / 'serioussam'],
            env={'LD_LIBRARY_PATH': f'/usr/lib:/lib:{data_dir}'},
        )
