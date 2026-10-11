from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext

_BERMUDA_BIN: Final = Path('/usr/bin/bermuda')
_DATA: Final = ROMS / 'ports' / 'bermuda'
_SAVES: Final = SAVES / 'bermuda'


@cached_dataclass
class Bermuda(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'bermuda',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        args: list[str | Path] = [
            _BERMUDA_BIN,
            f'--datapath={_DATA}',
            f'--musicpath={_DATA / "MUSIC"}',
            f'--savepath={_SAVES}',
            '--fullscreen',
        ]

        if self.config.get_bool('bermuda_aspect'):
            args.append('--widescreen=16:9')

        return Command(args, env={'SDL_JOYSTICK_HIDAPI': '0'})
