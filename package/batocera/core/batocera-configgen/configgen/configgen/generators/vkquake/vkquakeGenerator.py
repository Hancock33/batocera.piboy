#!/usr/bin/env python
import os
import shutil
from os import path

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

q1_src = "/usr/share/game_assets/quake1/id1/vkquake.pak"
q1_dst = "/userdata/roms/ports/quake1/id1/vkquake.pak"

class VkquakeGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["vkquake", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100"]

        shutil.copy(q1_src, q1_dst)

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
