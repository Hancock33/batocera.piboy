#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig
import utils.videoMode as videoMode

rtcw_src = "/usr/share/game_assets/rtcw/main"
rtcw_dst = "/userdata/roms/ports/rtcw/main"

class RtcwGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["iowolfsp", "+set", "r_mode", "-1", "+set" , "r_fullscreen", "1", "+set", "r_customwidth", str(gameResolution["width"]), "+set", "r_customheight",str(gameResolution["height"]), "+set", "r_swapInterval", "1"]

        shutil.copytree(rtcw_src, rtcw_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
