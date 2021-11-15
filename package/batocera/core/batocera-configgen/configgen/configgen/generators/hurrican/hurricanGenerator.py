#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class HurricanGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["hurrican"]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'PIPEWIRE_LATENCY': '1024/48000'
            })
