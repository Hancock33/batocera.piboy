from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class RednukemGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["rednukem", "-j", os.path.dirname(os.path.abspath(rom)), "-g", rom]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys rednukem.keys')
            return Command.Command(
                array=commandArray,
                env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
        else:
            return Command.Command(
                array=commandArray,
                env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "rednukem",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
