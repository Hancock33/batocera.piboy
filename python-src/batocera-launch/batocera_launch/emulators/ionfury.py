from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CONFIGS, SAVES
from batocera_launch import (
    Command,
    Emulator,
    HotkeysContext,
)

if TYPE_CHECKING:
    from pathlib import Path


@cached_dataclass
class Ionfury(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'ionfury',
            'keys': {
                'exit': 'killall -9 fury',
                'menu': 'KEY_ESC',
                'pause': 'KEY_ESC',
                'save_state': 'KEY_F6',
                'restore_state': 'KEY_F9',
                'screenshot': 'KEY_F12',
            },
        }

    @cached_property
    def config_dir(self) -> Path:
        return CONFIGS / self.core

    @cached_property
    def saves_dir(self) -> Path:
        return SAVES / self.core

    async def configure(self) -> Command:
        args: list[str | Path] = ['ionfury', '-game_dir', self.rom.parent, '-g', self.rom.stem]

        if self.config.get_bool('nologo'):
            args.append('-nologo')

        return Command(args)
