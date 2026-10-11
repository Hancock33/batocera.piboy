from __future__ import annotations

import logging
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_logger = logging.getLogger(__name__)

_HURRICAN_BIN: Final = 'hurrican'
_ROM_DIR: Final = Path('/userdata/roms/ports/hurrican')

_CUSTOM_LEVELS: Final[dict[str, str]] = {
    'ChJees': 'ChJees',
    'Genocide': 'Genocide',
    'Second_Empire': 'Second_Empire',
    'SecretPlanet': 'SecretPlanet',
    'Valentine': 'valentine',
    'Volcano_Temple': 'Volcano_Temple',
    'Walkers_World': 'Walkers_World',
}


@cached_dataclass
class Hurrican(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'hurrican',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return _ROM_DIR

    async def configure(self) -> Command:
        if not (_ROM_DIR / 'data' / 'levels').is_dir():
            _logger.error('ERROR: Game assets not installed. You can get them from the Batocera Content Downloader.')

        args: list[str | Path] = [_HURRICAN_BIN]

        if self.config.get_bool('hurrican_crt'):
            args.append('--crt')

        if (level := _CUSTOM_LEVELS.get(self.config.get_str('hurrican_custlevel', ''))) is not None:
            args.extend(['--custom', level])

        return Command(args)
