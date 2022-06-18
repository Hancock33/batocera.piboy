#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class OpenclawGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        os.chdir("/userdata/roms/ports/openclaw")
        commandArray = ["/usr/bin/openclaw"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
