from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command, controllersConfig
from ..Generator import Generator

class Srb2kartGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        commandArray = ["srb2kart", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SRB2WADDIR': '/userdata/roms/ports/srb2kart'
            })

    def getHotkeysContext(self):
        return {
            "name": "srb2kart",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
