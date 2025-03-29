import os
import shutil
from os import path

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator
from ...utils import videoMode as videoMode

class VcmiGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        gameResolution = videoMode.getCurrentResolution()

        if os.path.isfile('/tmp/piboy'):
            commandArray = ["vcmiclient", "--video-width", str(gameResolution["width"]), "--video-height", str(gameResolution["height"]), "--video-fullscreen", "true", "--video-realFullscreen", "false"]
        else:
            commandArray = ["vcmiclient", "--video-width", str(gameResolution["width"]), "--video-height", str(gameResolution["height"]), "--video-fullscreen", "false", "--video-realFullscreen", "false"]

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
