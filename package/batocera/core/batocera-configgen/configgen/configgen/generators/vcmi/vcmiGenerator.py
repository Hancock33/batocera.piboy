#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig
import utils.videoMode as videoMode

class VcmiGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        gameResolution = videoMode.getCurrentResolution()

        if os.path.isfile('/tmp/piboy'):
            commandArray = ["vcmiclient", "--video-width", str(gameResolution["width"]), "--video-height", str(gameResolution["height"]), "--video-fullscreen", "true", "--video-realFullscreen", "false"]
        else:
            commandArray = ["vcmiclient", "--video-width", str(gameResolution["width"]), "--video-height", str(gameResolution["height"]), "--video-fullscreen", "false", "--video-realFullscreen", "false"]

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/lib:/usr/lib:/usr/lib/vcmi:/usr/lib/vcmi/AI',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
