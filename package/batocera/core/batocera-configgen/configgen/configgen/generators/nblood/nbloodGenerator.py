from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command, controllersConfig
from ..Generator import Generator

class NbloodGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["nblood", "-j=" + os.path.dirname(os.path.abspath(rom))]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys nblood.keys')
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
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "nblood",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
