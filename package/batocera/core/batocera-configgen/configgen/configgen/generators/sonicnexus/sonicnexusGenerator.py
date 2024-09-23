import os
import shutil
import configparser

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class SonicNexusGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        source_file = '/usr/bin/sonicnexus'
        rom_directory = '/userdata/roms/ports/sonicnexus'
        destination_file = rom_directory + '/sonicnexus'
        if not os.path.exists(destination_file):
            shutil.copy(source_file, destination_file)

        ## Configuration

        # VSync
        if system.isOptSet('snexus_vsync'):
            selected_vsync = system.config['snexus_vsync']
        else:
            selected_vsync = 'y'

        ## Create the Settings.ini file
        config = configparser.ConfigParser()
        config.optionxform = str
        # Dev
        config['Dev'] = {
            'DevMenu': 'true',
            'EngineDebugMode': 'false',
            'StartingCategory': '255',
            'StartingScene': '255',
            'FastForwardSpeed': '8',
            'DataFile': 'Data.bin'
        }
        # Video
        config['Window'] = {
            'FullScreen': 'true',
            'Borderless': 'true',
            'EnhancedScaling': 'false',
            'vsync': selected_vsync,
            'WindowScale': '2',
            'ScreenWidth': '320',
            'RefreshRate': '60',
            'ColourMode': '1'
        }
        # Audio
        config['Audio'] = {
            'BGMVolume': '1.000000',
            'SFXVolume': '1.000000'
        }
        # Save the ini file
        with open( rom_directory + '/settings.ini', 'w') as configfile:
            config.write(configfile)

        with open(rom_directory + '/settings.ini',"r") as f:
            nexucfg = f.read()

        with open(rom_directory + '/settings.ini', 'w') as configfile:
            configfile.write(nexucfg.replace(" ",""))

        # Now run
        os.chdir(rom_directory)
        commandArray = [destination_file]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG":controllersConfig.generateSdlGameControllerConfig(playersControllers),
                "SDL_JOYSTICK_HIDAPI": "0"
            }
        )

    # Show mouse for menu / play actions
    def getMouseMode(self, config, rom):
        return False

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9
