#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class AlephoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        game = "/userdata/roms/ports/alephone/marathon"
        if (rom.__contains__("marathon2")):
            game = "/userdata/roms/ports/alephone/marathon2"

        if (rom.__contains__("infinity")):
            game = "/userdata/roms/ports/alephone/infinity"


        commandArray = ["alephone", game]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
