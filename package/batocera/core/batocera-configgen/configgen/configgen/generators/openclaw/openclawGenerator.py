from __future__ import annotations

from typing import TYPE_CHECKING
import os
import shutil

from ... import Command, controllersConfig
from ..Generator import Generator

claw_src = "/usr/share/game_assets/openclaw"
clawzip_src = "/usr/share/game_assets/openclaw_zip"
claw_dst = "/userdata/roms/ports/openclaw"

class OpenclawGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/openclaw")
        commandArray = ["/usr/bin/openclaw"]
        shutil.copytree(clawzip_src, claw_dst, dirs_exist_ok=True)

        # dont want to overwrite these file is exist
        if (os.path.exists(claw_dst + '/SAVES.XML') == False):
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
