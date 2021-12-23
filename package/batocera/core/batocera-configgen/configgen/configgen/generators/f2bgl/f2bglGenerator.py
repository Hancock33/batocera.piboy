#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class F2bglGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["f2bgl", "--datapath=/userdata/roms/f2bgl"]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers),
                'PIPEWIRE_LATENCY': '1024/48000'
            })
