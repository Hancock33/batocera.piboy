#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class Yquake2Generator(Generator):
    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gamemod = 'baseq2'
        if (rom.__contains__('rogue')):
            gamemod = 'rogue'

        if (rom.__contains__('xatrix')):
            gamemod = 'xatrix'

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