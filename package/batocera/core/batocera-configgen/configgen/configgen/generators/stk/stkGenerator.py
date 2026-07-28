from __future__ import annotations

import pathlib
import shutil
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class StkGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        # ini file
        config_src = '/usr/share/game_assets/supertuxkart'
        config_root = '/userdata/system/.config/supertuxkart'
        config_dst = '/userdata/system/.config/supertuxkart/config-0.10'

        if not pathlib.Path(config_root).exists():
            pathlib.Path(config_root).mkdir()

        if not pathlib.Path(config_dst).exists():
            pathlib.Path(config_dst).mkdir()
            shutil.copytree(config_src, config_dst, dirs_exist_ok=True)

        commandArray = ['supertuxkart', '--render-driver=vulkan', '-f']

        return Command.Command(
            array=commandArray,
            env={
                'SUPERTUXKART_DATADIR': '/userdata/roms/ports/stk',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            }
        )

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "supertuxkart",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
