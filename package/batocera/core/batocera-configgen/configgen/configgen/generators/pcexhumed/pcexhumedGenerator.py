from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class PcexhumedGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        commandArray = ["pcexhumed", "-j", os.path.dirname(os.path.abspath(rom))]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "pcexhumed",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
