from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path

_ROM_DIR: Final = ROMS / 'ports' / 'f2bgl'
_SAVES: Final = SAVES / 'f2bgl'


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
        args: list[str | Path] = [
            'f2bgl',
            '--fullscreen',
            f'--datapath={_ROM_DIR}',
            f'--savepath={_SAVES}',
        ]

        if self.config.get_bool('f2b_fog'):
            args.append('--no-fog')
        if self.config.get_bool('f2b_gouraud'):
            args.append('--no-gouraud')
        if filtering := self.config.get('f2b_filter'):
            args.append(f'--texturefilter={filtering}')
        if scaler := self.config.get('f2b_scaler'):
            args.append(f'--texturescaler={scaler}')
        if self.config.get_bool('f2b_sub'):
            args.append('--subtitles')
        if language := self.config.get('f2b_lang'):
            args.append(f'--language={language} --voice={language}')
        if level := self.config.get('f2b_level'):
            args.append(f'--level={level}')

        return Command(args)
