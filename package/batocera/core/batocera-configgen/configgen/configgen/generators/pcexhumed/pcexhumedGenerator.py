#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class PcexhumedGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["pcexhumed", "-j", "/userdata/roms/pcexhumed/"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '7.0',
                'PIPEWIRE_LATENCY': '1024/48000'
            })
