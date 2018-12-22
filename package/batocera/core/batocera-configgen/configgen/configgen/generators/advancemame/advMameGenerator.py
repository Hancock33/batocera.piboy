#!/usr/bin/env python
import Command
import recalboxFiles
from generators.Generator import Generator
import advMameControllers
import shutil
import os.path


class AdvMameGenerator(Generator):

    def getResolutionMode(self, config):
        return 'default'
    
    # Main entry of the module
    def generate(self, system, rom, playersControllers, gameResolution):
        romName = os.path.basename(os.path.splitext(rom)[0])
        commandArray = [recalboxFiles.recalboxBins[system.config['emulator']]]
        
        if not 'configfile' in system.config:
            # Using recalbox config file
            system.config['configfile'] = recalboxFiles.advancemameConfig
            advMameControllers.writeControllersConfig(system, playersControllers)
            
        commandArray.extend( ['-cfg', system.config['configfile']] )
        commandArray.append(romName)
        
        return Command.Command(array=commandArray, env={"TERM":"linux"})
