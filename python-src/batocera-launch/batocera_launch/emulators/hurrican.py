from __future__ import annotations

import logging
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_logger = logging.getLogger(__name__)

_ROM_DIR: Final = Path('/userdata/roms/ports/hurrican')


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

        args: list[str | Path] = ['hurrican']

        if self.config.get_bool('hurrican_crt'):
            args.append('--crt')

        if self.config.get('hurrican_custlevel') == 'ChJees':
            args.append('--custom')
            args.append('ChJees')
        elif self.config.get('hurrican_custlevel') == 'Genocide':
            args.append('--custom')
            args.append('Genocide')
        elif self.config.get('hurrican_custlevel') == 'Second_Empire':
            args.append('--custom')
            args.append('--Second_Empire')
        elif self.config.get('hurrican_custlevel') == 'SecretPlanet':
            args.append('--custom')
            args.append('SecretPlanet')
        elif self.config.get('hurrican_custlevel') == 'Valentine':
            args.append('--custom')
            args.append('valentine')
        elif self.config.get('hurrican_custlevel') == 'Volcano_Temple':
            args.append('--custom')
            args.append('Volcano_Temple')
        elif self.config.get('hurrican_custlevel') == 'Walkers_World':
            args.append('--custom')
            args.append('Walkers_World')

        return Command(
            args,
        )
