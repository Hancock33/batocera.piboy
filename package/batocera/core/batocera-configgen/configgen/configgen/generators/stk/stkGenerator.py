import os
import shutil
from os import path

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class StkGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        # ini file
        config_src = '/usr/share/game_assets/supertuxkart'
        config_root = '/userdata/system/.config/supertuxkart'
        config_dst = '/userdata/system/.config/supertuxkart/config-0.10'

        if not os.path.exists(config_root):
            os.mkdir(config_root)

        if not os.path.exists(config_dst):
            os.mkdir(config_dst)
            shutil.copytree(config_src, config_dst, dirs_exist_ok=True)

        commandArray = ['supertuxkart', '--render-driver=vulkan', '-f']

        return Command.Command(
            array=commandArray,
            env={
                'SUPERTUXKART_DATADIR': '/userdata/roms/ports/stk',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            }
        )

    def getHotkeysContext(self):
        return {
            "name": "supertuxkart",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
