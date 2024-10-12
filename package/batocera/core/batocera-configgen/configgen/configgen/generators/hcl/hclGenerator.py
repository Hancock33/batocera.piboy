from __future__ import annotations

import logging
import os
from typing import TYPE_CHECKING

from ... import Command, controllersConfig
from ...batoceraPaths import ROMS
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

eslog = logging.getLogger(__name__)

class HclGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "hcl",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/usr/share/hcl")
        commandArray = ["hcl", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
