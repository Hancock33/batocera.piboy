from __future__ import annotations

import os
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_ROM_DIR: Final = Path('/userdata/roms/ports/awgl')


@cached_dataclass
class Awgl(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'awgl',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return _ROM_DIR

    async def configure(self) -> Command:
        os.chdir(_ROM_DIR)
        args: list[str | Path] = ['awgl']

        if '15th' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/15th')

        if '20th' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/20th')

        if '3DO' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/3DO')

        if 'Amiga' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/Amiga')

        if 'Atari' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/Atari')

        if 'DOS' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/DOS')
            args.append('--mt32')

        if 'Win31' in self.rom.stem:
            args.append('--datapath=/userdata/roms/ports/awgl/Win31')

        # Rendering mode
        if self.config.get_str('awgl_render') == 'original':
            args.append('--render=original')
        elif self.config.get_str('awgl_render') == 'software':
            args.append('--render=software')
        elif self.config.get_str('awgl_render') == 'gl':
            args.append('--render=gl')
        else:
            args.append('--render=original')

        # Screen mode
        if self.config.get_str('awgl_fullscreen') == 'stretched':
            args.append('--fullscreen')
        elif self.config.get_str('awgl_fullscreen') == 'wide':
            args.append('--fullscreen-ar')
        else:
            args.append('--fullscreen')

        # Audio mode
        if self.config.get_str('awgl_audio') == 'original':
            args.append('--audio=original')
        elif self.config.get_str('awgl_audio') == 'remastered':
            args.append('--audio=remastered')
        else:
            args.append('--audio=original')

        # Language
        if self.config.get_str('awgl_language') == 'us':
            args.append('--language=us')
        elif self.config.get_str('awgl_language') == 'fr':
            args.append('--language=fr')
        elif self.config.get_str('awgl_language') == 'de':
            args.append('--language=de')
        elif self.config.get_str('awgl_language') == 'es':
            args.append('--language=es')
        elif self.config.get_str('awgl_language') == 'it':
            args.append('--language=it')
        else:
            args.append('--language=us')

        # Game difficulty
        if self.config.get_str('awgl_difficulty') == 'easy':
            args.append('--difficulty=easy')
        elif self.config.get_str('awgl_difficulty') == 'normal':
            args.append('--difficulty=normal')
        elif self.config.get_str('awgl_difficulty') == 'hard':
            args.append('--difficulty=hard')
        else:
            args.append('--difficulty=easy')

        # EGA screen mode for DOS
        if self.config.get_str('awgl_egados') == 'enabled':
            args.append('--ega-palette')

        return Command(
            args,
        )
