#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

rtcw_src = "/usr/share/game_assets/rtcw/main"
rtcw_dst = "/userdata/roms/ports/rtcw/main"

class RtcwGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["iowolfsp"]

        shutil.copytree(rtcw_src, rtcw_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
