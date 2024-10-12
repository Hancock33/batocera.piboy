from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command, controllersConfig
from ..Generator import Generator

class Srb2Generator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["srb2", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SRB2WADDIR': '/userdata/roms/ports/srb2',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })

    def getHotkeysContext(self):
        return {
            "name": "srb2",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
