#!/usr/bin/env python
import Command
import recalboxFiles
from generators.Generator import Generator
import os.path


class ScummVMGenerator(Generator):

    def getResolutionMode(self, config):
        return 'default'
    
    # Main entry of the module
    # Configure mupen and return a command
    def generate(self, system, rom, playersControllers, gameResolution):
        # Find rom path
        romPath = os.path.dirname(rom)
        romName = os.path.splitext(os.path.basename(rom))[0]
        # Get rom name without extension
        commandArray = [recalboxFiles.recalboxBins[system.config['emulator']],
                        "-f",
                        "--joystick=0", 
                        "--screenshotspath="+recalboxFiles.screenshotsDir, 
                        "--extrapath=/usr/share/scummvm",
                        "--savepath="+recalboxFiles.scummvmSaves,
                        "--path=""{}""".format(romPath)]
        commandArray.append("""{}""".format(romName))

        return Command.Command(array=commandArray, env={"SDL_VIDEO_GL_DRIVER":"/usr/lib/libGLESv2.so"})
