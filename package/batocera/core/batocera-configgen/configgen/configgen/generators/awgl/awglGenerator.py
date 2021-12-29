#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class AwglGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        os.chdir("/userdata/roms/awgl")
        rendr = "--render=software"
        if (rom.__contains__("15th")):
            game = "--datapath=/userdata/roms/awgl/15th"

        if (rom.__contains__("20th")):
            game = "--datapath=/userdata/roms/awgl/20th"
            rendr = "--render=original"

        if (rom.__contains__("3DO")):
            game = "--datapath=/userdata/roms/awgl/3DO"

        if (rom.__contains__("Amiga")):
            game = "--datapath=/userdata/roms/awgl/Amiga"

        if (rom.__contains__("Atari")):
            game = "--datapath=/userdata/roms/awgl/Atari"

        if (rom.__contains__("DOS")):
            game = "--datapath=/userdata/roms/awgl/DOS"

        if (rom.__contains__("Win31")):
            game = "--datapath=/userdata/roms/awgl/Win31"

        commandArray = ["awgl", game, "--language=us", rendr]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers),
                'PIPEWIRE_LATENCY': '1024/48000'
            })
