#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Supertux2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["supertux2" ]

        return Command.Command(
            array=commandArray,
            env={"SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)}
        )
