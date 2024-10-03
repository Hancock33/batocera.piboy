from __future__ import annotations

from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command, controllersConfig
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext


class PyxelGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        if Path(rom).suffix == '.pyxapp':
            cmd = 'play'
        else:
            cmd = 'run'

        commandArray = ["/usr/bin/pyxel", cmd, rom]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "pyxel",
            "keys": { "exit": "KEY_ESC" }
        }
