from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_OPENLARA_SRC: Final = Path('/usr/bin/OpenLara')


@cached_dataclass
class Openlara(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'OpenLara',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        openlara_rom_path = self.rom.parent
        destination_file = openlara_rom_path / 'OpenLara'

        openlara_rom_path.mkdir(parents=True, exist_ok=True)

        if destination_file.exists():
            destination_file.unlink()
        shutil.copy(_OPENLARA_SRC, destination_file)

        os.chdir(openlara_rom_path)

        return Command(
            ['OpenLara'],
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            },
        )
