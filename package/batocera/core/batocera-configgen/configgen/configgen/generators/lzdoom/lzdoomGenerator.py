#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class LzdoomGenerator(Generator):
    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ['/usr/share/lzdoom/lzdoom', '+set', 'use_joystick', 'true', '+set', 'use_mouse', 'false', '+set', 'fullscreen', 'true']

        # Rendering mode
        if system.isOptSet('lzdoom_render'):
            if system.config['lzdoom_render'] == 'gl':
                commandArray.extend(['+set', 'vid_preferbackend', '0', '+set', 'vid_rendermode', '4'])
            elif system.config['lzdoom_render'] == 'vulkan':
                commandArray.extend(['+set', 'vid_preferbackend', '1', '+set', 'vid_rendermode', '4'])
            elif system.config['lzdoom_render'] == 'soft':
                commandArray.extend(['+set', 'vid_preferbackend', '2', '+set', 'vid_rendermode', '4'])
            elif system.config['lzdoom_render'] == 'gles2':
                commandArray.extend(['+set', 'vid_preferbackend', '3', '+set', 'vid_rendermode', '3'])
        else:
                commandArray.extend(['+set', 'vid_preferbackend', '3', '+set', 'vid_rendermode', '3'])

        if (rom.__contains__('.uwad')):
            f=open(rom)
            content=f.readlines()
            for line in content:
                if 'IWAD=/' in line:
                    commandArray.extend(['-iwad', line.replace('IWAD=', '').replace('\n', '')])
                elif 'PWAD=/' in line:
                    commandArray.extend(['-file', line.replace('PWAD=', '').replace('\n', '')])
        else:
                    commandArray.extend(['-iwad', rom])

        if os.path.isfile('/tmp/piboy'):
            commandArray.extend(['+set uiscale 2'])
            #Controller
            commandArray.extend(['+set Axis0map -1', '+set Axis1map -1'])
            commandArray.extend(['+set Axis2map 0', '+set Axis3map 2'])

            commandArray.extend(['+bind Joy1 +altattack'])
            commandArray.extend(['+bind Joy2 +attack'])
            commandArray.extend(['+bind Joy3 +jump'])
            commandArray.extend(['+bind Joy4 +use'])
            commandArray.extend(['+bind Joy5 weapnext'])
            commandArray.extend(['+bind Joy6 +reload'])
            commandArray.extend(['+bind Joy7 +moveleft'])
            commandArray.extend(['+bind Joy8 +moveright'])
            commandArray.extend(['+bind Joy9 menu_main'])
            commandArray.extend(['+bind Joy10 pause'])

        return Command.Command(
            array=commandArray,
            env={
            'DOOMWADDIR': '/userdata/roms/ports/doom',
            'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })