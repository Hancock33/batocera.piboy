from __future__ import annotations

import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_CLAW_SRC: Final = Path('/usr/share/game_assets/openclaw')
_CLAWZIP_SRC: Final = Path('/usr/share/game_assets/openclaw_zip')
_CLAW_DST: Final = Path('/userdata/roms/ports/openclaw')


@cached_dataclass
class Openclaw(Emulator):
    needs_sdl_game_controller_config = True

    @staticmethod
    def _ensure_config() -> None:
        _CLAW_DST.mkdir(parents=True, exist_ok=True)
        shutil.copytree(_CLAW_SRC, _CLAW_DST, dirs_exist_ok=True)
        shutil.copytree(_CLAWZIP_SRC, _CLAW_DST, dirs_exist_ok=True)

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'openclaw',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return self.rom.parent

    async def configure(self) -> Command:
        self._ensure_config()

        return Command(
            ['openclaw'],
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            },
        )
