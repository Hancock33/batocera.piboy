from __future__ import annotations

import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

_CONFIG_SRC: Final = Path('/usr/share/game_assets/supertuxkart')
_CONFIG_ROOT: Final = Path('/userdata/system/.config/supertuxkart')
_CONFIG_DST: Final = _CONFIG_ROOT / 'config-0.10'
_DATA: Final = ROMS / 'ports' / 'stk'


@cached_dataclass
class Stk(Emulator):
    needs_sdl_game_controller_config = True

    @staticmethod
    def _ensure_config() -> None:
        _CONFIG_ROOT.mkdir(parents=True, exist_ok=True)
        if not _CONFIG_DST.exists():
            shutil.copytree(_CONFIG_SRC, _CONFIG_DST, dirs_exist_ok=True)

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'supertuxkart',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        self._ensure_config()

        return Command(
            ['supertuxkart', '--render-driver=vulkan', '-f'],
            env={'SUPERTUXKART_DATADIR': _DATA},
        )
