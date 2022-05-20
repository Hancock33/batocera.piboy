#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class HurricanGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["hurrican"]
        os.chdir(os.path.dirname(os.path.abspath(rom)))
        
        if system.isOptSet("crt"):
            if system.config['crt'] == '1':
                commandArray.append("--crt")

        if system.isOptSet("custlevel"):
            if system.config['crt'] == 'ChJees':
                commandArray.append("--custom")
                commandArray.append("ChJees")
            elif system.config['crt'] == 'Genocide':
                commandArray.append("--custom")
                commandArray.append("Genocide")
            elif system.config['crt'] == 'Second_Empire':
                commandArray.append("--custom")
                commandArray.append("--Second_Empire")
            elif system.config['crt'] == 'SecretPlanet':
                commandArray.append("--custom")
                commandArray.append("SecretPlanet")
            elif system.config['crt'] == 'valentine':
                commandArray.append("--custom")
                commandArray.append("valentine")
            elif system.config['crt'] == 'Volcano_Temple':
                commandArray.append("--custom")
                commandArray.append("Volcano_Temple")
            elif system.config['crt'] == 'Walkers_World':
                commandArray.append("--custom")
                commandArray.append("Walkers_World")
                
        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
