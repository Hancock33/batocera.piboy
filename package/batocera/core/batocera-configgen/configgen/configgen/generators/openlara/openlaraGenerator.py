from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...batoceraPaths import mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class OpenlaraGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        openlaraRomPath = rom.parent
        openlaraSourcePath = Path("/usr/bin/OpenLara")

        # Ensure the destination directories exist
        mkdir_if_not_exists(openlaraRomPath)

        # Copy files & folders if they don't exist
        destination_file = Path(str(openlaraRomPath) + '/OpenLara')
        if os.path.exists(destination_file):
            os.remove(destination_file)
            shutil.copy(openlaraSourcePath, destination_file)
        else:
            shutil.copy(openlaraSourcePath, destination_file)

        os.chdir(openlaraRomPath)

        commandArray = [openlaraRomPath / "OpenLara"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "openlara",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
