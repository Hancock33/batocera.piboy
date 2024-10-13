from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command, controllersConfig
from ..Generator import Generator

class RottGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["rott-darkwar"]

        return Command.Command(array=commandArray)

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "rott-darkwar",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
