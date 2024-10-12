from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command, controllersConfig
from ..Generator import Generator

class PcexhumedGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["pcexhumed", "-j", os.path.dirname(os.path.abspath(rom))]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "pcexhumed",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
