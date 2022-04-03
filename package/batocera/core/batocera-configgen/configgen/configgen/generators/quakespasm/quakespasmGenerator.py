#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class QuakespasmGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-sndspeed", "44100"]

        if (rom.lower().__contains__("hipnotic")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-sndspeed", "44100", "-hipnotic"]

        if (rom.lower().__contains__("rogue")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-sndspeed", "44100", "-rogue"]

        if (rom.lower().__contains__("dopa")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/tyrquake", "-sndspeed", "44100", "-game", "dopa"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
