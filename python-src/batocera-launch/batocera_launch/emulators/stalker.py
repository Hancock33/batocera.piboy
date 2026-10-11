from __future__ import annotations

import logging
from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path

_logger = logging.getLogger(__name__)


@cached_dataclass
class Stalker(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'xr_3da',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        _logger.debug('rom path: %s', self.rom)
        _logger.debug('rom file extension: %s', self.rom.suffix)

        args: list[str | Path] = ['xr_3da']

        # Skip Intro
        if self.config.get_bool('stalker_intro'):
            args.append('-nologo')

        # Clear Sky / Shadow of Chernobyl variants
        if self.rom.suffix == '.cs':
            args.append('-cs')
        if self.rom.suffix == '.soc':
            args.append('-soc')

        return Command(args)
