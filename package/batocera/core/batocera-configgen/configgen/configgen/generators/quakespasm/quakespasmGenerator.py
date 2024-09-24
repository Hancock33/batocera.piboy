import os
import shutil
from os import path

from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ...utils import videoMode as videoMode
from ..Generator import Generator

q1_src = "/usr/share/game_assets/quake1/id1/quakespasm.pak"
q1_dst = "/userdata/roms/ports/quake1/id1/quakespasm.pak"

class QuakespasmGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["quakespasm", "-basedir", "/userdata/roms/ports/quake1", "-sndspeed", "44100", "+set" , "vid_fullscreen", "1", "+set", "vid_width", str(gameResolution["width"]), "+set", "vid_height",str(gameResolution["height"])]

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
