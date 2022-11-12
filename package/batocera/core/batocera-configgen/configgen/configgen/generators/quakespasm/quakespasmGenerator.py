#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

q1_src = "/usr/share/game_assets/quake1/id1/quakespasm.pak"
q1_dst = "/userdata/roms/ports/quake1/id1/quakespasm.pak"

class QuakespasmGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["quakespasm", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100"]

        shutil.copy(q1_src, q1_dst)

        if (rom.lower().__contains__("hipnotic")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "-hipnotic"]

        if (rom.lower().__contains__("rogue")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "-rogue"]

        if (rom.lower().__contains__("dopa")):
            commandArray = ["quakespasm", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "-game", "dopa"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
