#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

from utils.logger import get_logger
eslog = get_logger(__name__)

class Fallout2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        romdir = os.path.dirname(os.path.abspath(rom))
        eslog.info(f"Game directory {str(romdir)}")

        if (romdir.__contains__("/fallout1")):
            os.chdir("/userdata/roms/ports/fallout1")
            commandArray = ["fallout-ce"]
        else:
            os.chdir("/userdata/roms/ports/fallout2")
            commandArray = ["fallout2-ce"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
