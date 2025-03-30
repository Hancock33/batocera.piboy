import os
from os import path

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class VirtualjaguarGenerator(Generator):
    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        commandArray = ['virtualjaguar', rom]

        # Rendering mode
        if system.isOptSet('virtualjaguar_frameskip'):
             commandArray.extend(['-frameskip', system.config['virtualjaguar_frameskip']])

        if system.isOptSet('virtualjaguar_bios'):
            if system.config['virtualjaguar_bios'] == '1':
                commandArray.extend(['-bios'])
            elif system.config['virtualjaguar_bios'] == '0':
                commandArray.extend(['-nobios'])

        if system.isOptSet('virtualjaguar_dsp'):
            if system.config['virtualjaguar_dsp'] == 'yes':
                commandArray.extend(['-dsp'])
            elif system.config['virtualjaguar_dsp'] == 'no':
                commandArray.extend(['-nodsp'])
        else:
                commandArray.extend(['-dsp'])

        if system.isOptSet('virtualjaguar_dsp_pipe'):
            if system.config['virtualjaguar_dsp_pipe'] == 'yes':
                commandArray.extend(['-pipeline'])
            elif system.config['virtualjaguar_dsp_pipe'] == 'no':
                commandArray.extend(['-nopipeline'])

        if system.isOptSet('virtualjaguar_region'):
            if system.config['virtualjaguar_region'] == 'ntsc':
                commandArray.extend(['-ntsc'])
            elif system.config['virtualjaguar_region'] == 'pal':
                commandArray.extend(['-pal'])

        return Command.Command(
            array=commandArray,
            env={
              'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
        })
