#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig
import utils.videoMode as videoMode

jkja_src = "/usr/share/game_assets/openjkja"
jkja_dst = "/userdata/roms/ports/openjkja"

class OpenjkjaGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["openjk_sp", "+set", "fs_basepath", "/userdata/roms/ports/openjkja", "+set", "r_mode", "-1", "+set" ,"r_fullscreen", "1", "+set", "r_customwidth", str(gameResolution["width"]), "+set", "r_customheight",str(gameResolution["height"]), "+set", "r_swapInterval", "1"]

        shutil.copytree(jkja_src, jkja_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
