from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...batoceraPaths import mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class TRXGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "trx",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "save_state": "KEY_F5", "restore_state": "KEY_F6" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        trxRomPath = rom.parent
        trxSourcePath = Path("/usr/bin/TRX")

        # Ensure the destination directories exist
        mkdir_if_not_exists(trxRomPath)

        # Copy files & folders if they don't exist
        destination_file = Path(str(trxRomPath) + '/TRX')
        if os.path.exists(destination_file):
            os.remove(destination_file)
            shutil.copy(trxSourcePath, destination_file)
        else:
            shutil.copy(trxSourcePath, destination_file)

        commandArray = [trxRomPath / "TRX"]

        romExt = os.path.splitext(rom)[1]
        if system.config.get_bool("trx-expansion"):
            if romExt == ".trx1":
                commandArray.extend(["--mod", "tr1-ub"])
            if romExt == ".trx2":
                commandArray.extend(["--mod", "tr2-gm"])
            if romExt == ".trx3":
                commandArray.extend(["--mod", "tr3-la"])
        else:
            if romExt == ".trx1":
                commandArray.extend(["--mod", "tr1"])
            if romExt == ".trx2":
                commandArray.extend(["--mod", "tr2"])
            if romExt == ".trx3":
                commandArray.extend(["--mod", "tr3"])

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers),
                "SDL_JOYSTICK_HIDAPI": "0"
            }
        )

    def getInGameRatio(self, config, gameResolution, rom):
        if gameResolution["width"] / float(gameResolution["height"]) > ((16.0 / 9.0) - 0.1):
            return 16/9
        return 4/3
