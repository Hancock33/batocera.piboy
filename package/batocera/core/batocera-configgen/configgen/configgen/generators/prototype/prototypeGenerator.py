from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command, controllersConfig
from ..Generator import Generator

class PrototypeGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["prototype"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "prototype",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
