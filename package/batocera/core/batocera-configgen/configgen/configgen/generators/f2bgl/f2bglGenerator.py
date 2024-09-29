import os
from os import path

from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class F2bglGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/f2bgl")
        commandArray = ["f2bgl", "--fullscreen", "--datapath=/userdata/roms/ports/f2bgl", "--savepath=/userdata/saves/f2bgl"]

        if system.isOptSet('f2b_fog'):
            if system.config['f2b_fog'] == '0':
                commandArray.extend(['--no-fog'])

        if system.isOptSet('f2b_gouraud'):
            if system.config['f2b_gouraud'] == '0':
                commandArray.extend(['--no-gouraud'])

        if system.isOptSet('f2b_filter'):
            strf2b_filter = '--texturefilter=' + system.config['f2b_filter']
            commandArray.extend([strf2b_filter])

        if system.isOptSet('f2b_scaler'):
            strf2b_scaler = '--texturescaler=' + system.config['f2b_scaler']
            commandArray.extend([strf2b_scaler])

        if system.isOptSet('f2b_sub'):
            if system.config['f2b_sub'] == '1':
                commandArray.extend(['--subtitles'])

        if system.isOptSet('f2b_lang'):
            strf2b_lang = '--language=' + system.config['f2b_lang'] + ' --voice=' + system.config['f2b_lang']
            commandArray.extend([strf2b_lang])

        if system.isOptSet('f2b_level'):
            strf2b_level = '--level=' + system.config['f2b_level']
            commandArray.extend([strf2b_level])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
