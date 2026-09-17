from __future__ import annotations

import os
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_ROM_DIR: Final = Path('/userdata/roms/ports/f2bgl')


@cached_dataclass
class F2bgl(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'f2bgl',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return _ROM_DIR

    async def configure(self) -> Command:
        os.chdir(_ROM_DIR)
        args: list[str | Path] = [
            'f2bgl',
            '--fullscreen',
            '--datapath=/userdata/roms/ports/f2bgl',
            '--savepath=/userdata/saves/f2bgl',
        ]

        if self.config.get_bool('f2b_fog'):
            args.append('--no-fog')

        if self.config.get_bool('f2b_gouraud'):
            args.append('--no-gouraud')

        if self.config.get('f2b_filter'):
            args.append('--texturefilter=' + self.config['f2b_filter'])

        if self.config.get('f2b_scaler'):
            args.append('--texturescaler=' + self.config['f2b_scaler'])

        if self.config.get_bool('f2b_sub'):
            args.append('--subtitles')

        if self.config.get('f2b_lang'):
            args.extend(['--language=' + self.config['f2b_lang'] + ' --voice=' + self.config['f2b_lang']])

        if self.config.get('f2b_level'):
            args.append('--level=' + self.config['f2b_level'])

        return Command(
            args,
        )
