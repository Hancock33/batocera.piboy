from __future__ import annotations

import os
import shutil
from pathlib import Path

from ... import Command
from ...batoceraPaths import mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class OpenlaraGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "openlara",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        openlaraRomPath = rom.parent
        openlaraSourcePath = Path("/usr/bin/OpenLara")

        # Ensure the destination directories exist
        mkdir_if_not_exists(openlaraRomPath)

        # Copy files & folders if they don't exist
        destination_file = Path(str(openlaraRomPath) + '/OpenLara')
        if Path(destination_file).exists():
            Path(destination_file).unlink()
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
