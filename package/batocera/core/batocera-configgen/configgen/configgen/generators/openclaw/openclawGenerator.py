from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

claw_src = "/usr/share/game_assets/openclaw"
clawzip_src = "/usr/share/game_assets/openclaw_zip"
claw_dst = "/userdata/roms/ports/openclaw"

class OpenclawGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        os.chdir(claw_dst)
        commandArray = ["/usr/bin/openclaw"]
        
        shutil.copytree(clawzip_src, claw_dst, dirs_exist_ok=True)

        # dont want to overwrite these file is exist
        if (not Path(claw_dst + '/SAVES.XML').exists()):
            shutil.copytree(claw_src, claw_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "openclaw",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
