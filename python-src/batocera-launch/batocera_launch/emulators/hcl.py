from __future__ import annotations

import logging
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_logger = logging.getLogger(__name__)

_ROM_DIR: Final = Path('/usr/share/hcl')


@cached_dataclass
class Hcl(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'hcl',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return _ROM_DIR

    async def configure(self) -> Command:
        if not (_ROM_DIR / 'data' / 'map').is_dir():
            _logger.error('ERROR: Game assets not installed. You can get them from the Batocera Content Downloader.')

        return Command(['hcl', '-d'])
