from __future__ import annotations

import os
import pathlib
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class HurricanGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["hurrican", "--pathsave", "/userdata/saves/hurrican/"]
        os.chdir(pathlib.Path(pathlib.Path(rom).resolve()).parent)

        if system.isOptSet("hurrican_crt") and system.config['hurrican_crt'] == '1':
            commandArray.append("--crt")

        if system.isOptSet("hurrican_custlevel"):
            if system.config['hurrican_custlevel'] == 'ChJees':
                commandArray.append("--custom")
                commandArray.append("ChJees")
            elif system.config['hurrican_custlevel'] == 'Genocide':
                commandArray.append("--custom")
                commandArray.append("Genocide")
            elif system.config['hurrican_custlevel'] == 'Second_Empire':
                commandArray.append("--custom")
                commandArray.append("--Second_Empire")
            elif system.config['hurrican_custlevel'] == 'SecretPlanet':
                commandArray.append("--custom")
                commandArray.append("SecretPlanet")
            elif system.config['hurrican_custlevel'] == 'valentine':
                commandArray.append("--custom")
                commandArray.append("valentine")
            elif system.config['hurrican_custlevel'] == 'Volcano_Temple':
                commandArray.append("--custom")
                commandArray.append("Volcano_Temple")
            elif system.config['hurrican_custlevel'] == 'Walkers_World':
                commandArray.append("--custom")
                commandArray.append("Walkers_World")

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "hurrican",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
