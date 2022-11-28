#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class OpentyrianGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        if (rom.__contains__("2000")):
            commandArray = ["opentyrian2000", "-t" "/usr/share/tyrian2000/", "-j"]
        else:
            commandArray = ["opentyrian", "-t" "/usr/share/opentyrian/data/", "-j"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
