#!/usr/bin/env python

import Command
import os
from generators.Generator import Generator
import controllersConfig


class RaptorGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        os.chdir("/userdata/roms/raptor")
        commandArray = ["raptor"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
