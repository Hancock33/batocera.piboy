from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_RAPTOR_CONFIG_DIR: Final = Path('/userdata/system/configs/raptor')
_RAPTOR_SETUP_INI: Final = _RAPTOR_CONFIG_DIR / 'SETUP.INI'
_RAPTOR_DEFAULT_SETUP_INI: Final = Path('/usr/share/raptor/SETUP.INI')


@cached_dataclass
class Raptor(Emulator):
    needs_sdl_game_controller_config = True

    @staticmethod
    def _ensure_config() -> None:
        _RAPTOR_CONFIG_DIR.mkdir(parents=True, exist_ok=True)
        if not _RAPTOR_SETUP_INI.is_file():
            shutil.copyfile(_RAPTOR_DEFAULT_SETUP_INI, _RAPTOR_SETUP_INI)

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'raptor',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        self._ensure_config()
        os.chdir('/userdata/roms/ports/raptor')

        return Command(
            ['raptor'],
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            },
        )
