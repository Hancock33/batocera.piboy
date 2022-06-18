#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class VkquakeGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["vkquake", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100"]

        if (rom.lower().__contains__("hipnotic")):
            commandArray = ["vkquake", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "-hipnotic"]

        if (rom.lower().__contains__("rogue")):
            commandArray = ["vkquake", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "-rogue"]

        if (rom.lower().__contains__("dopa")):
            commandArray = ["vkquake", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "-game", "dopa"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
