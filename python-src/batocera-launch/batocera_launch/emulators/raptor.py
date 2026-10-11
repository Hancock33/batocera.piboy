from __future__ import annotations

import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CONFIGS
from batocera_launch import Command, Emulator, HotkeysContext

_CONFIG_DIR: Final = CONFIGS / 'raptor'
_SETUP_INI: Final = _CONFIG_DIR / 'SETUP.INI'
_DEFAULT_SETUP_INI: Final = Path('/usr/share/raptor/SETUP.INI')


@cached_dataclass
class Raptor(Emulator):
    needs_sdl_game_controller_config = True

    @staticmethod
    def _ensure_config() -> None:
        _CONFIG_DIR.mkdir(parents=True, exist_ok=True)
        if not _SETUP_INI.is_file():
            shutil.copyfile(_DEFAULT_SETUP_INI, _SETUP_INI)

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'raptor',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return self.rom.parent

    async def configure(self) -> Command:
        self._ensure_config()

        return Command(
            ['raptor'],
            env={'SDL_AUTO_UPDATE_JOYSTICKS': '0'},
        )
