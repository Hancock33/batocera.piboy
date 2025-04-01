import os
import shutil
import configparser

from ... import Command
from ...batoceraPaths import ROMS
from ...controller import generate_sdl_game_controller_config
from ...utils.configparser import CaseSensitiveConfigParser
from ..Generator import Generator

class SonicManiaGenerator(Generator):

    def getHotkeysContext(self):
        return {
            "name": "sonic_mania",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "menu": "KEY_ENTER", "pause": "KEY_ENTER" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        source_file = '/usr/bin/sonicmania'
        rom_directory = '/userdata/roms/ports/sonicmania'
        destination_file = rom_directory + '/sonicmania'
        if not os.path.exists(destination_file):
            shutil.copy(source_file, destination_file)

        ## Configuration

        # VSync
        selected_vsync = system.config.get('smania_vsync', 'y')

        # Triple Buffering
        selected_buffering = system.config.get('smania_buffering', 'n')

        # Language
        selected_language = system.config.get('smania_language', '0')

        ## Create the Settings.ini file
        config = configparser.ConfigParser()
        config.optionxform = str
        # Game
        config['Game'] = {
            'devMenu': 'y',
            'faceButtonFlip': 'n',
            'enableControllerDebugging': 'n',
            'disableFocusPause': 'n',
            'region': '-1',
            'language': selected_language
        }
        # Video
        config['Video'] = {
            'windowed': 'n',
            'border': 'n',
            'exclusiveFS': 'y',
            'vsync': selected_vsync,
            'tripleBuffering': selected_buffering,
            'winWidth': '848',
            'winHeight': '480',
            'refreshRate': '60',
            'shaderSupport': 'y',
            'screenShader': '1',
            'maxPixWidth': '0'
        }
        # Audio
        config['Audio'] = {
            'streamsEnabled': 'y',
            'streamVolume': '1.000000',
            'sfxVolume': '1.000000'
        }
        # Save the ini file
        with open( rom_directory + '/Settings.ini', 'w') as configfile:
            config.write(configfile)

        # Now run
        os.chdir(rom_directory)
        commandArray = [destination_file]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers),
                "SDL_JOYSTICK_HIDAPI": "0"
            }
        )

    # Show mouse for menu / play actions
    def getMouseMode(self, config, rom):
        return False

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9
