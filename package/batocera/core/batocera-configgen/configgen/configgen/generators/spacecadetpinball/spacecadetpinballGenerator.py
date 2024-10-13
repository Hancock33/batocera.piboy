from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command, controllersConfig
from ..Generator import Generator

class SpacecadetpinballGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["SpaceCadetPinball", "-fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self):
        return {
            "name": "SpaceCadetPinball",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
