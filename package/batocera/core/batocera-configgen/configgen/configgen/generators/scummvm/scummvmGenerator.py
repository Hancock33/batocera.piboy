#!/usr/bin/env python
import Command
import batoceraFiles
from generators.Generator import Generator
import controllersConfig
import os.path
import glob
import utils.videoMode as videoMode

class ScummVMGenerator(Generator):
    # Main entry of the module
    # Configure mupen and return a command
    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        sWH = "--window-size=" + str(gameResolution["width"]) + "," + str(gameResolution["height"])
        # crete /userdata/roms/scummvm/extras folder if it doesn't exist
        if not os.path.exists('/userdata/roms/scummvm/extras'):
            os.makedirs('/userdata/roms/scummvm/extras')

        # Find rom path
        if os.path.isdir(rom):
          # rom is a directory: must contains a <game name>.scummvm file
          romPath = rom
          romFile = glob.glob(romPath + "/*.scummvm")[0]
          romName = os.path.splitext(os.path.basename(romFile))[0]
        else:
          # rom is a file: split in directory and file name
          romPath = os.path.dirname(rom)
          # Get rom name without extension
          romName = os.path.splitext(os.path.basename(rom))[0]

        # pad number
        nplayer = 1
        id = 0
        for playercontroller, pad in sorted(playersControllers.items()):
            if nplayer == 1:
                id=pad.index
            nplayer += 1

        commandArray = [batoceraFiles.batoceraBins[system.config['emulator']],
                        "-f",
                        f"--joystick={id}",
                        "--screenshotspath="+batoceraFiles.screenshotsDir,
                        "--extrapath=/userdata/roms/scummvm/extras",
                        "--savepath="+batoceraFiles.scummvmSaves]
        # gfx mode
        if system.isOptSet('scummvm_render'):
            if system.config['scummvm_render'] == 'sdl':
                commandArray.extend(["--gfx-mode=surfacesdl"])
            elif system.config['scummvm_render'] == 'gl':
                commandArray.extend(["--gfx-mode=opengl"])
                commandArray.extend([sWH])
        else:
                commandArray.extend(["--gfx-mode=''"])

        # strech mode
        if system.isOptSet('scummvm_strech'):
            if system.config['scummvm_strech'] == '0':
                commandArray.extend(["--stretch-mode=center"])
            if system.config['scummvm_strech'] == '1':
                commandArray.extend(["--stretch-mode=pixel-perfect"])
            if system.config['scummvm_strech'] == '2':
                commandArray.extend(["--stretch-mode=fit"])
            if system.config['scummvm_strech'] == '3':
                commandArray.extend(["--stretch-mode=stretch"])
            if system.config['scummvm_strech'] == '4':
                commandArray.extend(["--stretch-mode=fit_force_aspect"])
        else:
                commandArray.extend(["--stretch-mode=''"])

        # scaler
        if system.isOptSet('scummvm_scaler'):
            if system.config['scummvm_scaler'] == '0':
                commandArray.extend(["--scaler=normal"])
            if system.config['scummvm_scaler'] == '1':
                commandArray.extend(["--scaler=hq"])
            if system.config['scummvm_scaler'] == '2':
                commandArray.extend(["--scaler=edge"])
            if system.config['scummvm_scaler'] == '3':
                commandArray.extend(["--scaler=advmame"])
            if system.config['scummvm_scaler'] == '4':
                commandArray.extend(["--scaler=sai"])
            if system.config['scummvm_scaler'] == '5':
                commandArray.extend(["--scaler=supersai"])
            if system.config['scummvm_scaler'] == '6':
                commandArray.extend(["--scaler=supereagle"])
            if system.config['scummvm_scaler'] == '7':
                commandArray.extend(["--scaler=pm"])
            if system.config['scummvm_scaler'] == '8':
                commandArray.extend(["--scaler=dotmatrix"])
            if system.config['scummvm_scaler'] == '9':
                commandArray.extend(["--scaler=tv2x"])
        else:
                commandArray.extend(["--scaler=''"])

        # scale factor
        if system.isOptSet('scummvm_scale_factor'):
            if system.config['scummvm_scale_factor'] == '1':
                commandArray.extend(["--scale-factor=1"])
            if system.config['scummvm_scale_factor'] == '2':
                commandArray.extend(["--scale-factor=2"])
            if system.config['scummvm_scale_factor'] == '3':
                commandArray.extend(["--scale-factor=3"])
            if system.config['scummvm_scale_factor'] == '4':
                commandArray.extend(["--scale-factor=4"])
            if system.config['scummvm_scale_factor'] == '5':
                commandArray.extend(["--scale-factor=5"])
        else:
                commandArray.extend(["--scale-factor=0"])

        # aspect ratio
        if system.isOptSet('scummvm_aspect_ratio'):
            if system.config['scummvm_aspect_ratio'] == '0':
                commandArray.extend(["--no-aspect-ratio"])
            if system.config['scummvm_aspect_ratio'] == '1':
                commandArray.extend(["--aspect-ratio"])
        else:
                commandArray.extend(["--aspect-ratio"])

        # bilinear filtering
        if system.isOptSet('scummvm_filtering'):
            if system.config['scummvm_filtering'] == '0':
                commandArray.extend(["--no-filtering"])
            if system.config['scummvm_filtering'] == '1':
                commandArray.extend(["--filtering"])
        else:
                commandArray.extend(["--no-filtering"])

        commandArray.append("--path=""{}""".format(romPath))
        commandArray.append(f"""{romName}""")

        return Command.Command(array=commandArray,env={
            "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
