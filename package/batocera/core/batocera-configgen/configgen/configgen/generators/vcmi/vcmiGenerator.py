import os
import shutil
from os import path

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class VcmiGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        commandArray = ["vcmiclient"]

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/lib:/usr/lib:/usr/lib/vcmi:/usr/lib/vcmi/AI',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self):
        return {
            "name": "vcmiclient",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
