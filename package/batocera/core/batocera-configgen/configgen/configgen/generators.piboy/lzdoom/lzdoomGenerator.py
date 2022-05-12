#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class LzdoomGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["/usr/share/lzdoom/lzdoom"]

        # Rendering mode
        if system.isOptSet("lzdoom_render"):
            if system.config['lzdoom_render'] == 'gl':
                commandArray.append("+set")
                commandArray.append("vid_preferbackend")
                commandArray.append("0")
                commandArray.append("+set")
                commandArray.append("vid_rendermode")
                commandArray.append("4")
            elif system.config['lzdoom_render'] == 'vulkan':
                commandArray.append("+set")
                commandArray.append("vid_preferbackend")
                commandArray.append("1")
                commandArray.append("+set")
                commandArray.append("vid_rendermode")
                commandArray.append("4")
            elif system.config['lzdoom_render'] == 'soft':
                commandArray.append("+set")
                commandArray.append("vid_preferbackend")
                commandArray.append("2")
                commandArray.append("+set")
                commandArray.append("vid_rendermode")
                commandArray.append("4")
            elif system.config['lzdoom_render'] == 'gles2':
                commandArray.append("+set")
                commandArray.append("vid_preferbackend")
                commandArray.append("3")
                commandArray.append("+set")
                commandArray.append("vid_rendermode")
                commandArray.append("3")
        else:
                commandArray.append("+set")
                commandArray.append("vid_preferbackend")
                commandArray.append("1")
                commandArray.append("+set")
                commandArray.append("vid_rendermode")
                commandArray.append("4")
    
        if (rom.__contains__(".gzdoom")):
            f=open(rom)
            content=f.readlines()
            commandArray.append("-iwad")
            commandArray.append(content[0])
            commandArray.append("-file")
            commandArray.append(content[1])

        else:
            commandArray.append("-iwad")
            commandArray.append(rom)

        return Command.Command(
            array=commandArray,
            env={
                'DOOMWADDIR': '/userdata/roms/prboom',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
