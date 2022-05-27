#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Yquake2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gamemod = "baseq2"
        if (rom.__contains__("rogue")):
            gamemod = "rogue"

        if (rom.__contains__("xatrix")):
            gamemod = "xatrix"

        commandArray = ["quake2", "-datadir", "/userdata/roms/yquake2", "+set", "r_vsync", "1", "+set", "vk_sampleshading", "0", "+set", "vk_polyblend", "0", "+set", "vk_dynamic", "0", "+set", "vk_postprocess", "0", "+set", "game" , gamemod]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
