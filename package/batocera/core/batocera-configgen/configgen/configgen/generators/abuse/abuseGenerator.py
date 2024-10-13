
from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command, controllersConfig
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class AbuseGenerator(Generator):
    if os.path.isfile('/tmp/piboy'):
        os.system('piboy_keys abuse.keys')

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["abuse", "-datadir", "/usr/share/abuse"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "abuse",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
