from __future__ import annotations

import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_OMF_SRC: Final = Path('/usr/share/games/openomf/')
_OMF_DST: Final = Path('/userdata/roms/ports/omf2097')


@cached_dataclass
class Omf2097(Emulator):
    needs_sdl_game_controller_config = True

    @staticmethod
    def _ensure_config() -> None:
        (_OMF_DST / 'resources').mkdir(parents=True, exist_ok=True)
        (_OMF_DST / 'shaders').mkdir(parents=True, exist_ok=True)
        shutil.copytree(_OMF_SRC / 'resources', _OMF_DST / 'resources', dirs_exist_ok=True)
        shutil.copytree(_OMF_SRC / 'shaders', _OMF_DST / 'shaders', dirs_exist_ok=True)
        shutil.copy('/usr/bin/openomf', _OMF_DST / 'openomf')

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'omf2097',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        self._ensure_config()

        return Command(
            [str(_OMF_DST / 'openomf')],
            env={
                'OPENOMF_RESOURCE_DIR': str(_OMF_DST),
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            },
        )
