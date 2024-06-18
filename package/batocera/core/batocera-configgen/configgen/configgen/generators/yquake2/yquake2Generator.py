#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

baseq2_src = "/usr/share/game_assets/quake2/baseq2"
rogue_src = "/usr/share/game_assets/quake2/rogue"
xatrix_src = "/usr/share/game_assets/quake2/xatrix"
baseq2_dst = "/userdata/roms/ports/quake2/baseq2"
rogue_dst = "/userdata/roms/ports/quake2/rogue"
xatrix_dst = "/userdata/roms/ports/quake2/xatrix"

class Yquake2Generator(Generator):
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        gamemod = 'baseq2'
        shutil.copytree(baseq2_src, baseq2_dst, dirs_exist_ok=True)

        if (rom.__contains__('rogue')):
            gamemod = 'rogue'
            shutil.copytree(rogue_src, rogue_dst, dirs_exist_ok=True)

        if (rom.__contains__('xatrix')):
            gamemod = 'xatrix'
            shutil.copytree(xatrix_src, xatrix_dst, dirs_exist_ok=True)

        commandArray = ['quake2', '-datadir', '/userdata/roms/ports/quake2']
        # Rendering mode
        if system.isOptSet('yquake2_render'):
            if system.config['yquake2_render'] == 'gl':
                commandArray.extend(['+set', 'vid_renderer', 'gl1'])
            elif system.config['yquake2_render'] == 'vulkan':
                commandArray.extend(['+set', 'vid_renderer', 'vulkan'])
            elif system.config['yquake2_render'] == 'soft':
                commandArray.extend(['+set', 'vid_renderer', 'soft'])
        else:
                commandArray.extend(['+set', 'vid_renderer', 'vk'])

        if os.path.isfile('/tmp/piboy'):
            commandArray.extend(['+set', 'r_hudscale', '2'])
            commandArray.extend(['+set', 'r_menuscale', '2'])

        commandArray.extend(['+set', 'game', gamemod])
        return Command.Command(
            array=commandArray,
            env={
            'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
