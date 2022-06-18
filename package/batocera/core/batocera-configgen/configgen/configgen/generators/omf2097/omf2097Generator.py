#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Omf2097Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["openomf"]

        return Command.Command(
            array=commandArray,
            env={
                'OPENOMF_RESOURCE_DIR' : '/userdata/roms/ports/omf2097',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
