#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig

class Srb2kartGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["srb2kart", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SRB2WADDIR': '/userdata/roms/ports/srb2kart'
            })
