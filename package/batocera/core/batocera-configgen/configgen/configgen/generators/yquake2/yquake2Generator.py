#!/usr/bin/env python

import Command
import batoceraFiles
from generators.Generator import Generator
import controllersConfig


class Yquake2Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        gamemod = "baseq2"
        if (rom.__contains__("rogue")):
            gamemod = "rogue"

        if (rom.__contains__("xatrix")):
            gamemod = "xatrix"

        commandArray = ["quake2", "-datadir", "/userdata/roms/yquake2", "+set", "vid_renderer", "vk", "+set", "r_vsync", "1", "+set", "vk_sampleshading", "0", "+set", "vk_polyblend", "0", "+set", "vk_dynamic", "0", "+set", "vk_postprocess", "0",
"+set", "game" , gamemod]

        return Command.Command(
            array=commandArray,
            env={XDG_DATA_HOME":batoceraFiles.CONF, "QT_QPA_PLATFORM":"xcb",
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
