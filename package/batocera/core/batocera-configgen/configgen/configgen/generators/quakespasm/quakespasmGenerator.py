#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class QuakespasmGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake"]

        if (rom.__contains__("hipnotic")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-hipnotic"]

        if (rom.__contains__("rogue")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-rogue"]

        if (rom.__contains__("dopa")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-game", "dopa"]


        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
