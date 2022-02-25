#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class AlephoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        game = "/userdata/roms/alephone/marathon"
        if (rom.__contains__("marathon2")):
            game = "/userdata/roms/alephone/marathon2"

        if (rom.__contains__("infinity")):
            game = "/userdata/roms/alephone/infinity"


        commandArray = ["alephone", "--nogl", game]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
