#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Yquake2Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        gamemod = "baseq2"
        if (rom.__contains__("rogue")):
            gamemod = "rogue"

        if (rom.__contains__("xatrix")):
            gamemod = "xatrix"

        commandArray = ["quake2", "-datadir", "/userdata/roms/yquake2", "+set", "vid_renderer", "soft", "+set", "r_vsync", "1", "+set", "game" , gamemod]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'PIPEWIRE_LATENCY': '1024/48000'
            })
