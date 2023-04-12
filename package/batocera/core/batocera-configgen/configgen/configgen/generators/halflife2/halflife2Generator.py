#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

hl2_src = "/usr/bin/hl2/hl2_assets"
hl2_dst = "/userdata/roms/ports/halflife2/hl2"

class Halflife2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["/usr/bin/hl2/hl2_launcher"]
        os.chdir("/usr/bin/hl2")

        shutil.copytree(hl2_src, hl2_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
