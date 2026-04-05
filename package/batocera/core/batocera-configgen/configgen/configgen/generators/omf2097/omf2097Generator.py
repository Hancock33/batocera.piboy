from __future__ import annotations

import filecmp
import shutil

from typing import TYPE_CHECKING
from pathlib import Path

from ... import Command, controllersConfig
from ...batoceraPaths import mkdir_if_not_exists
from ..Generator import Generator

class Omf2097Generator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "omf2097",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        omf_src = Path("/usr/share/games/openomf/")
        omf_dst = Path("/userdata/roms/ports/omf2097")

        mkdir_if_not_exists(omf_dst / "resources")
        mkdir_if_not_exists(omf_dst / "shaders")
        shutil.copytree(omf_src / "resources", omf_dst / "resources", dirs_exist_ok=True)
        shutil.copytree(omf_src / "shaders", omf_dst / "shaders", dirs_exist_ok=True)
        shutil.copy("/usr/bin/openomf", omf_dst / "openomf")

        commandArray = [omf_dst / "openomf"]

        return Command.Command(
            array=commandArray,
            env={
                'OPENOMF_RESOURCE_DIR' : omf_dst,
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
