#!/usr/bin/env python

import Command
import batoceraFiles
from generators.Generator import Generator
import controllersConfig


class Eduke32Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["eduke32", rom]

        return Command.Command(
            array=commandArray,
            env={
            env={"XDG_DATA_HOME":batoceraFiles.CONF, "QT_QPA_PLATFORM":"xcb",
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
