#!/usr/bin/env python
import batoceraFiles
import Command
import controllersConfig
from generators.Generator import Generator
import os
from os import path

base_dir = f"{batoceraFiles.HOME}/.local/share/GSC Game World"
cop_dir = f"{batoceraFiles.HOME}/.local/share/GSC Game World/S.T.A.L.K.E.R. - Call of Pripyat"
cs_dir = f"{batoceraFiles.HOME}/.local/share/GSC Game World/S.T.A.L.K.E.R. - Clear Sky"
cop_romdir = "/userdata/roms/ports/stalker/cop"
cs_romdir = "/userdata/roms/ports/stalker/cop"
assests = ['levels', 'localization', 'mp', 'patches', 'resources']

class StalkerGenerator(Generator):
    def generate(self, system, rom, playersControllers, guns, gameResolution):
        if not os.path.exists(base_dir):
            os.mkdir(base_dir)
            
        commandArray = ["xr_3da"]
        
        # Skip Intro
        if system.isOptSet('stalker_intro') and system.getOptBoolean('stalker_intro'):
            commandArray.extend(['-nointro'])
      
        # Call of Clear Sky
        if (rom.lower()).endswith('cs'):
            if not os.path.exists(cs_dir):
                os.mkdir(cs_dir)
            for asset in assests:
                if not os.path.islink(cs_dir + '/' + asset):
                    os.symlink(cs_romdir + '/' + asset, cs_dir + '/' + asset)       
            commandArray.extend(['-cs'])
        else:
        # Call of Pripyat      
            if not os.path.exists(cop_dir):
                os.mkdir(cop_dir)
            for asset in assests:
                if not os.path.islink(cop_dir + '/' + asset):
                    os.symlink(cop_romdir + '/' + asset, cop_dir + '/' + asset)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
