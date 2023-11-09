#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig
import configparser

sm_src = "/usr/share/game_assets/sonicmania/Game.so"
sm_dst = "/userdata/roms/ports/sonicretro/Sonic Mania.som/Game.so"

class SonicRetroGenerator(Generator):
    def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):

        # Determine the emulator to use
        if (rom.lower()).endswith('son'):
            iniFile = rom + '/settings.ini'
            emu = "sonic2013"
        elif (rom.lower()).endswith('som'):
            shutil.copyfile(sm_src, sm_dst)
            iniFile = rom + '/Settings.ini'
            emu = 'sonicmania'
        elif (rom.lower()).endswith('snx'):
            iniFile = rom + '/settings.ini'
            emu = 'sonicnexus'
        else:
            iniFile = rom + '/settings.ini'
            emu = 'soniccd'

        # Some code copied from Citra's generator and adapted.
        sonicButtons = {
            'Up':       '11',
            'Down':     '12',
            'Left':     '13',
            'Right':    '14',
            'A':        '0',
            'B':        '1',
            'C':        '2',
            'X':        '3',
            'Y':        '22',
            'Z':        '23',
            'L':        '9',
            'R':        '10',
            'Select':   '4',
            'Start':    '6'
        }

        sonicKeys = {
            'Up':       '82',
            'Down':     '81',
            'Left':     '80',
            'Right':    '79',
            'A':        '29',
            'B':        '27',
            'C':        '6',
            'X':        '4',
            'Y':        '22',
            'Z':        '7',
            'L':        '20',
            'R':        '8',
            'Start':    '40',
            'Select':   '43'
        }

        # ini file
        sonicConfig = configparser.RawConfigParser(strict=False)
        sonicConfig.optionxform=str     # Add Case Sensitive comportement
        if os.path.exists(iniFile):
            os.remove(iniFile)          # Force removing settings.ini
            sonicConfig.read(iniFile)

        # [Dev]
        if (emu == 'sonic2013') or (emu == 'soniccd'):
            if not sonicConfig.has_section('Dev'):
                sonicConfig.add_section('Dev')
            if system.isOptSet('devmenu') and system.config['devmenu'] == '1':
                sonicConfig.set('Dev', 'DevMenu', 'true')
            else:
                sonicConfig.set('Dev', 'DevMenu', 'false')
            sonicConfig.set('Dev', 'EngineDebugMode', 'false')
            if (emu == 'sonic2013'):
                sonicConfig.set('Dev', 'StartingCategory', '255')
                sonicConfig.set('Dev', 'StartingScene', '255')
                sonicConfig.set('Dev', 'StartingPlayer', '255')
                sonicConfig.set('Dev', 'StartingSaveFile', '255')
            else:
                sonicConfig.set('Dev', 'StartingCategory', '0')
                sonicConfig.set('Dev', 'StartingScene', '0')
                sonicConfig.set('Dev', 'UseSteamDir', 'false')
            sonicConfig.set('Dev', 'FastForwardSpeed', '8')
            if system.isOptSet('hqmode') and system.config['hqmode'] == '0':
                sonicConfig.set('Dev', 'UseHQModes', 'false')
            else:
                sonicConfig.set('Dev', 'UseHQModes', 'true')
            sonicConfig.set('Dev', 'DataFile', 'Data.rsdk')

        # [Game]
        if not sonicConfig.has_section('Game'):
            sonicConfig.add_section('Game')

        if (emu == 'sonic2013'):
            if system.isOptSet('skipstart') and system.config['skipstart'] == '1':
                sonicConfig.set('Game', 'SkipStartMenu', 'true')
            else:
                sonicConfig.set('Game', 'SkipStartMenu', 'false')
        elif (emu == 'soniccd'):
            if system.isOptSet('spindash'):
                sonicConfig.set('Game', 'OriginalControls', system.config['spindash'])
            else:
                sonicConfig.set('Game', 'OriginalControls', '-1')
            sonicConfig.set('Game', 'DisableTouchControls', 'true')

        if system.isOptSet('language'):
            sonicConfig.set('Game', 'Language', system.config['language'])
        else:
            sonicConfig.set('Game', 'Language', '0')

        # [Window]
        if (emu == 'sonic2013') or (emu == 'soniccd') or (emu == 'sonicnexus'):
            if not sonicConfig.has_section('Window'):
                sonicConfig.add_section('Window')

            sonicConfig.set('Window', 'FullScreen', 'true')
            sonicConfig.set('Window', 'Borderless', 'true')
            if system.isOptSet('vsync') and system.config['vsync'] == '0':
                sonicConfig.set('Window', 'VSync', 'false')
            else:
                sonicConfig.set('Window', 'VSync', 'true')
            if system.isOptSet('scalingmode'):
                sonicConfig.set('Window', 'ScalingMode', system.config['scalingmode'])
            else:
                sonicConfig.set('Window', 'ScalingMode', '2')
            sonicConfig.set('Window', 'WindowScale', '2')
            sonicConfig.set('Window', 'ScreenWidth', '320')
            sonicConfig.set('Window', 'RefreshRate', '60')
            sonicConfig.set('Window', 'DimLimit', '-1')

        if (emu == 'sonicmania'):
            if not sonicConfig.has_section('Video'):
                sonicConfig.add_section('Video')
            sonicConfig.set('Video', 'windowed', 'false')
            sonicConfig.set('Video', 'border', 'false')
            sonicConfig.set('Video', 'exclusiveFS', 'true')
            if system.isOptSet('vsync') and system.config['vsync'] == '0':
                sonicConfig.set('Video', 'vsync', 'false')
            else:
                sonicConfig.set('Video', 'vsync', 'true')
            sonicConfig.set('Video', 'tripleBuffering', 'true')
            sonicConfig.set('Video', 'fsWidth', '424')
            sonicConfig.set('Video', 'fsHeight', '240')
            sonicConfig.set('Video', 'refreshRate', '60')
            sonicConfig.set('Video', 'shaderSupport', 'true')
            sonicConfig.set('Video', 'screenShader', '0')
            sonicConfig.set('Video', 'pixWidth', '424')

        # [Audio]
        if not sonicConfig.has_section('Audio'):
            sonicConfig.add_section('Audio')

        if (emu == 'sonicmania'):
            sonicConfig.set('Audio', 'streamsEnabled', '1.000000')
            sonicConfig.set('Audio', 'streamVolume', '1.000000')
            sonicConfig.set('Audio', 'sfxVolume', '1.000000')
        else:
            sonicConfig.set('Audio', 'BGMVolume', '1.000000')
            sonicConfig.set('Audio', 'SFXVolume', '1.000000')

        # [Keyboard 1]
        if not sonicConfig.has_section('Keyboard 1'):
            sonicConfig.add_section('Keyboard 1')

        for x in sonicKeys:
            sonicConfig.set('Keyboard 1', f'{x}', f'{sonicKeys[x]}')

        # [Controller 1]
        if not sonicConfig.has_section('Controller 1'):
            sonicConfig.add_section('Controller 1')

        for index in playersControllers:
            controller = playersControllers[index]
            if controller.player != '1':
                continue
            for x in sonicButtons:
                sonicConfig.set('Controller 1', f'{x}', f'{sonicButtons[x]}')
            break

        with open(iniFile, 'w') as configfile:
            sonicConfig.write(configfile, False)

        os.chdir(rom)
        commandArray = [emu]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getMouseMode(self, config, rom):
        # Determine the emulator to use
        if (rom.lower()).endswith("son"):
            emu = "sonic2013"
        else:
            emu = "soniccd"

        mouseRoms = [
            "1bd5ad366df1765c98d20b53c092a528", # iOS version of SonicCD
        ]

        enableMouse = False
        if (emu == "soniccd"):
            import hashlib
            enableMouse = hashlib.md5(open(f"{rom}/Data.rsdk", "rb").read()).hexdigest() in mouseRoms
        else:
            enableMouse = False

        return enableMouse
