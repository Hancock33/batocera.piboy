#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os
from os import path
import configparser
import shutil

class SonicRetroGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        soniccdpath = "/userdata/system/.local/share/RSDKv3"
        sonic2013path = "/userdata/system/.local/share/RSDKv4"
        
        #create paths
        if not path.isdir(soniccdpath):
            os.mkdir(soniccdpath)
            
        if not path.isdir(sonic2013path):
            os.mkdir(sonic2013path)
        
        # Determine the emulator to use
        if (rom.lower()).endswith("son"):
            emu = "sonic2013"
            iniFile = sonic2013path + "/settings.ini"
        else:
            emu = "soniccd"
            iniFile = soniccdpath + "/settings.ini"
       
        # ini file
        sonicConfig = configparser.RawConfigParser(strict=False)
        sonicConfig.optionxform=str             # Add Case Sensitive comportement
        if os.path.exists(iniFile):
            os.remove(iniFile)          # Force removing settings.ini
            sonicConfig.read(iniFile)
        
        # [Dev]
        if not sonicConfig.has_section("Dev"):
            sonicConfig.add_section("Dev")
        if system.isOptSet('devmenu') and system.config["devmenu"] == 1:
            sonicConfig.set("Dev", "DevMenu", "true")
        else:
            sonicConfig.set("Dev", "DevMenu", "false")
        sonicConfig.set("Dev", "EngineDebugMode", "false")
        if (emu == "sonic2013"):
            sonicConfig.set("Dev", "StartingCategory", "255")
            sonicConfig.set("Dev", "StartingScene", "255")
            sonicConfig.set("Dev", "StartingPlayer", "255")
            sonicConfig.set("Dev", "StartingSaveFile", "255")
        else:
            sonicConfig.set("Dev", "StartingCategory", "0")
            sonicConfig.set("Dev", "StartingScene", "0")
            sonicConfig.set("Dev", "UseSteamDir", "false")
        sonicConfig.set("Dev", "FastForwardSpeed", "8")
        if system.isOptSet('hqmode') and system.config["hqmode"] == 0:
            sonicConfig.set("Dev", "UseHQModes", "false")
        else:
            sonicConfig.set("Dev", "UseHQModes", "true")
        sonicConfig.set("Dev", "DataFile", "Data.rsdk")
        
        # [Game]
        if not sonicConfig.has_section("Game"):
            sonicConfig.add_section("Game")
        
        if (emu == "sonic2013"):
            if system.isOptSet('skipstart') and system.config["skipstart"] == 1:
                sonicConfig.set("Game", "SkipStartMenu", "true")
            else:
                sonicConfig.set("Game", "SkipStartMenu", "false")
        else:
            if system.isOptSet('spindash'):
                sonicConfig.set("Game", "OriginalControls", system.config["spindash"])
            else:
                sonicConfig.set("Game", "OriginalControls", "-1")
            sonicConfig.set("Game", "DisableTouchControls", "true")
        if system.isOptSet('language'):
            sonicConfig.set("Game", "Language", system.config["language"])
        else:
            sonicConfig.set("Game", "Language", "0")
        
        # [Window]
        if not sonicConfig.has_section("Window"):
            sonicConfig.add_section("Window")
        
        sonicConfig.set("Window", "FullScreen", "true")
        sonicConfig.set("Window", "Borderless", "true")
        if system.isOptSet('vsync') and system.config["vsync"] == "0":
            sonicConfig.set("Window", "VSync", "false")
        else:
            sonicConfig.set("Window", "VSync", "true")
        if system.isOptSet('scalingmode'):
            sonicConfig.set("Window", "ScalingMode", system.config["scalingmode"])
        else:
            sonicConfig.set("Window", "ScalingMode", "2")
        sonicConfig.set("Window", "WindowScale", "2")
        sonicConfig.set("Window", "ScreenWidth", "320")
        sonicConfig.set("Window", "RefreshRate", "60")
        sonicConfig.set("Window", "DimLimit", "-1")
        
        # [Audio]
        if not sonicConfig.has_section("Audio"):
            sonicConfig.add_section("Audio")
        
        sonicConfig.set("Audio", "BGMVolume", "1.000000")
        sonicConfig.set("Audio", "SFXVolume", "1.000000")

        with open(iniFile, 'w') as configfile:
            sonicConfig.write(configfile, False)
        
        os.chdir(rom)
        commandArray = [emu]
        
        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })