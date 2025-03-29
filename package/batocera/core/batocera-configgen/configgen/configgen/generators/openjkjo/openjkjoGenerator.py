from __future__ import annotations

from typing import TYPE_CHECKING
import shutil

from ... import Command, controllersConfig
from ..Generator import Generator
from ...utils import videoMode as videoMode

jkjo_src = "/usr/share/game_assets/openjkjo"
jkjo_dst = "/userdata/roms/ports/openjkjo"

class OpenjkjoGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["openjo_sp", "+set", "fs_basepath", "/userdata/roms/ports/openjkjo", "+set", "r_mode", "-1", "+set" , "r_fullscreen", "1", "+set", "r_customwidth", str(gameResolution["width"]), "+set", "r_customheight",str(gameResolution["height"]), "+set", "r_swapInterval", "1", "+set", "com_jk2", "1"]

        shutil.copytree(jkjo_src, jkjo_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "openjkjo",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
