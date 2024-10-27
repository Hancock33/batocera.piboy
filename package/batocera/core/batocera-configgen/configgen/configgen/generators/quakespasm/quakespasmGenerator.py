from __future__ import annotations

from typing import TYPE_CHECKING
import shutil

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator
from ...utils import videoMode as videoMode

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
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "tyrquake",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
