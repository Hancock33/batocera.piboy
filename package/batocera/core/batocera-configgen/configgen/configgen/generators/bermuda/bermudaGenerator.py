from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class BermudaGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/bermuda")
        commandArray = ["bermuda", "--datapath=/userdata/roms/ports/bermuda", "--musicpath=/userdata/roms/ports/bermuda/MUSIC", "--savepath=/userdata/saves/bermuda", "--fullscreen"]

        if system.isOptSet("bermuda_aspect"):
            if system.config['bermuda_aspect'] == '1':
                commandArray.append("--widescreen=16:9")

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "bermuda",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
