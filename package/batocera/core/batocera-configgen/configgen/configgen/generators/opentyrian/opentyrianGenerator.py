from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command, controllersConfig
from ..Generator import Generator

class OpentyrianGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        if (rom.__contains__("2000")):
            commandArray = ["opentyrian2000", "-t" "/usr/share/tyrian2000/", "-j"]
        else:
            commandArray = ["opentyrian", "-t" "/usr/share/opentyrian/data/", "-j"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "opentyrian",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
