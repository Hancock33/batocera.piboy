import os
from os import path
import Command
import batoceraFiles
import shutil
from generators.Generator import Generator
import controllersConfig
import os.path
import zipfile
import configparser
from settings.unixSettings import UnixSettings
from generators.libretro import libretroControllers
from os.path import dirname
from utils.logger import get_logger

eslog = get_logger(__name__)

class AmiberryGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        retroconfig = UnixSettings(batoceraFiles.amiberryRetroarchCustom, separator=' ')
        if not os.path.exists(dirname(batoceraFiles.amiberryRetroarchCustom)):
            os.makedirs(dirname(batoceraFiles.amiberryRetroarchCustom))

        romType = self.getRomType(rom)
        eslog.debug("romType: "+romType)
        if romType != 'UNKNOWN' :
            commandArray = [ batoceraFiles.batoceraBins[system.config['emulator']], "-G" ]
            if romType != 'WHDL' :
                commandArray.append("--model")
                commandArray.append(system.config['core'])

            if romType == 'WHDL' :
                commandArray.append("--autoload")
                commandArray.append(rom)
            elif romType == 'HDF' :
                commandArray.append("-s")
                commandArray.append("hardfile2=rw,DH0:"+rom+",32,1,2,512,0,,uae0")
                commandArray.append("-s")
                commandArray.append("uaehf0=hdf,rw,DH0:"+rom+",32,1,2,512,0,,uae0")
            elif romType == 'CD' :
                commandArray.append("--cdimage")
                commandArray.append(rom)
            elif romType == 'DISK':
                # floppies
                n = 0
                for img in self.floppiesFromRom(rom):
                    if n < 4:
                        commandArray.append("-" + str(n))
                        commandArray.append(img)
                    n += 1
                # floppy path
                commandArray.append("-s")
                # Use disk folder as floppy path
                romPathIndex = rom.rfind('/')
                commandArray.append("amiberry.floppy_path="+rom[0:romPathIndex])

            # controller
            libretroControllers.writeControllersConfig(retroconfig, system, playersControllers, True)
            retroconfig.write()

            if not os.path.exists(batoceraFiles.amiberryRetroarchInputsDir):
                os.makedirs(batoceraFiles.amiberryRetroarchInputsDir)
            nplayer = 1
            for playercontroller, pad in sorted(playersControllers.items()):
                replacements = {'_player' + str(nplayer) + '_':'_'}
                # amiberry remove / included in pads names like "USB Downlo01.80 PS3/USB Corded Gamepad"
                padfilename = pad.realName.replace("/", "")
                playerInputFilename = batoceraFiles.amiberryRetroarchInputsDir + "/" + padfilename + ".cfg"
                with open(batoceraFiles.amiberryRetroarchCustom) as infile, open(playerInputFilename, 'w') as outfile:
                    for line in infile:
                        for src, target in replacements.items():
                            newline = line.replace(src, target)
                            if not newline.isspace():
                                outfile.write(newline)
                if nplayer == 1: # 1 = joystick port
                    commandArray.append("-s")
                    commandArray.append("joyport1_friendlyname=" + padfilename)
                    if romType == 'CD' :
                        commandArray.append("-s")
                        commandArray.append("joyport1mode=cd32joy")
                if nplayer == 2: # 0 = mouse for the player 2
                    commandArray.append("-s")
                    commandArray.append("joyport0_friendlyname=" + padfilename)
                nplayer += 1

            # fps
            if system.config['showFPS'] == 'true':
                commandArray.append("-s")
                commandArray.append("show_leds=true")

            # disable port 2 (otherwise, the joystick goes on it)
            commandArray.append("-s")
            commandArray.append("joyport2=")

            # remove interlace artifacts
            if system.isOptSet("amiberry_flickerfixer") and system.config['amiberry_flickerfixer'] == 'enabled':
                commandArray.append("-s")
                commandArray.append("gfx_flickerfixer=true")
            elif system.isOptSet("amiberry_flickerfixer") and system.config['amiberry_flickerfixer'] == 'disabled':
                commandArray.append("-s")
                commandArray.append("gfx_flickerfixer=false")
            else:
                commandArray.append("-s")
                commandArray.append("gfx_flickerfixer=false")

            # auto crop
            if system.isOptSet("amiberry_auto_crop") and system.config['amiberry_auto_crop'] == 'enabled':
                commandArray.append("-s")
                commandArray.append("amiberry.gfx_auto_crop=true")
            elif system.isOptSet("amiberry_auto_crop") and system.config['amiberry_auto_crop'] == 'disabled':
                commandArray.append("-s")
                commandArray.append("amiberry.gfx_auto_crop=false")
            else:
                commandArray.append("-s")
                commandArray.append("amiberry.gfx_auto_crop=false")

            # line mode
            if system.isOptSet("amiberry_linemode"):
                if system.config['amiberry_linemode'] == 'none':
                    commandArray.append("-s")
                    commandArray.append("gfx_linemode=none")
                elif system.config['amiberry_linemode'] == 'scanlines':
                    commandArray.append("-s")
                    commandArray.append("gfx_linemode=scanlines")
                elif system.config['amiberry_linemode'] == 'double':
                    commandArray.append("-s")
                    commandArray.append("gfx_linemode=double")
            else:
                commandArray.append("-s")
                commandArray.append("gfx_linemode=double")

            # video resolution
            if system.isOptSet("amiberry_resolution"):
                if system.config['amiberry_resolution'] == 'lores':
                    commandArray.append("-s")
                    commandArray.append("gfx_resolution=lores")
                elif system.config['amiberry_resolution'] == 'superhires':
                    commandArray.append("-s")
                    commandArray.append("gfx_resolution=superhires")
                elif system.config['amiberry_resolution'] == 'hires':
                    commandArray.append("-s")
                    commandArray.append("gfx_resolution=hires")
            else:
                commandArray.append("-s")
                commandArray.append("gfx_resolution=hires")

            # Scaling method
            if system.isOptSet("amiberry_scalingmethod"):
                if system.config['amiberry_scalingmethod'] == 'automatic':
                    commandArray.append("-s")
                    commandArray.append("gfx_lores_mode=false")
                    commandArray.append("-s")
                    commandArray.append("amiberry.scaling_method=-1")
                elif system.config['amiberry_scalingmethod'] == 'smooth':
                    commandArray.append("-s")
                    commandArray.append("gfx_lores_mode=true")
                    commandArray.append("-s")
                    commandArray.append("amiberry.scaling_method=1")
                elif system.config['amiberry_scalingmethod'] == 'pixelated':
                    commandArray.append("-s")
                    commandArray.append("gfx_lores_mode=true")
                    commandArray.append("-s")
                    commandArray.append("amiberry.scaling_method=0")
            else:
                commandArray.append("-s")
                commandArray.append("gfx_lores_mode=false")
                commandArray.append("-s")
                commandArray.append("amiberry.scaling_method=-1")

            # Image centering
            if system.isOptSet("amiberry_image_center") and system.config['amiberry_image_center'] == 'all':
                commandArray.append("-s")
                commandArray.append("gfx_center_vertical=smart")
                commandArray.append("-s")
                commandArray.append("gfx_center_horizontal=smart")
            elif system.isOptSet("amiberry_image_center") and system.config['amiberry_image_center'] == 'vertical':
                commandArray.append("-s")
                commandArray.append("gfx_center_vertical=smart")
                commandArray.append("-s")
                commandArray.append("gfx_center_horizontal=none")
            elif system.isOptSet("amiberry_image_center") and system.config['amiberry_image_center'] == 'horizontal':
                commandArray.append("-s")
                commandArray.append("gfx_center_vertical=none")
                commandArray.append("-s")
                commandArray.append("gfx_center_horizontal=smart")
            elif system.isOptSet("amiberry_image_center") and system.config['amiberry_image_center'] == 'none':
                commandArray.append("-s")
                commandArray.append("gfx_center_vertical=none")
                commandArray.append("-s")
                commandArray.append("gfx_center_horizontal=none")
            else:
                commandArray.append("-s")
                commandArray.append("gfx_center_vertical=smart")
                commandArray.append("-s")
                commandArray.append("gfx_center_horizontal=smart")

            # Floppy drive sound
            if system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == 'nofloppysound':
                commandArray.append("-s")
                commandArray.append("floppy0sound=0")
                commandArray.append("-s")
                commandArray.append("floppy1sound=0")
                commandArray.append("-s")
                commandArray.append("floppy2sound=0")
                commandArray.append("-s")
                commandArray.append("floppy3sound=0")
                commandArray.append("-s")
                commandArray.append("floppy_volume=100")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '10':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=100")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '20':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=80")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '30':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=70")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '40':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=60")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '50':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=50")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '60':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=40")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '70':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=30")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '80':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=20")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '90':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=10")
            elif system.isOptSet("amiberry_floppy_sound") and system.config['amiberry_floppy_sound'] == '100':
                commandArray.append("-s")
                commandArray.append("floppy0sound=1")
                commandArray.append("-s")
                commandArray.append("floppy1sound=1")
                commandArray.append("-s")
                commandArray.append("floppy2sound=1")
                commandArray.append("-s")
                commandArray.append("floppy3sound=1")
                commandArray.append("-s")
                commandArray.append("floppy_volume=0")
            else:
                commandArray.append("-s")
                commandArray.append("floppy0sound=0")
                commandArray.append("-s")
                commandArray.append("floppy1sound=0")
                commandArray.append("-s")
                commandArray.append("floppy2sound=0")
                commandArray.append("-s")
                commandArray.append("floppy3sound=0")
                commandArray.append("-s")
                commandArray.append("floppy_volume=100")

            # sound buffer
            if system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == 'min':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=0")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '1':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=1024")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '2':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=2048")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '3':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=3072")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '4':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=4096")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '5':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=5120")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '6':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=6144")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '7':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=7168")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '8':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=8192")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '9':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=9216")
            elif system.isOptSet("amiberry_soundbuffer") and system.config['amiberry_soundbuffer'] == '10':
                commandArray.append("-s")
                commandArray.append("sound_max_buff=10240")
            else:
                commandArray.append("-s")
                commandArray.append("sound_max_buff=4096")

            # default soundcard
            if system.isOptSet('amiberry_default_soundcard') and system.config['amiberry_default_soundcard'] == '1':
                commandArray.append("-o")
                commandArray.append("default_soundcard=1")
            elif system.isOptSet('amiberry_default_soundcard') and system.config['amiberry_default_soundcard'] == '2':
                commandArray.append("-o")
                commandArray.append("default_soundcard=2")
            elif system.isOptSet('amiberry_default_soundcard') and system.config['amiberry_default_soundcard'] == '3':
                commandArray.append("-o")
                commandArray.append("default_soundcard=3")
            elif system.isOptSet('amiberry_default_soundcard') and system.config['amiberry_default_soundcard'] == '4':
                commandArray.append("-o")
                commandArray.append("default_soundcard=4")
            elif system.isOptSet('amiberry_default_soundcard') and system.config['amiberry_default_soundcard'] == '5':
                commandArray.append("-o")
                commandArray.append("default_soundcard=5")
            else:
                commandArray.append("-o")
                commandArray.append("default_soundcard=0")

            # Forcing full-window Mode
            commandArray.append("-s")
            commandArray.append("gfx_fullscreen_amiga=fullwindow")

            os.chdir("/usr/share/amiberry")
            return Command.Command(array=commandArray,env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)})
        # otherwise, unknown format
        return Command.Command(array=[])

    def floppiesFromRom(self, rom):
        floppies = []

        # split path and extension
        filepath, fileext = path.splitext(rom)

        #
        indexDisk = filepath.rfind("(Disk 1")

        # from one file (x1.zip), get the list of all existing files with the same extension + last char (as number) suffix
        # for example, "/path/toto0.zip" becomes ["/path/toto0.zip", "/path/toto1.zip", "/path/toto2.zip"]
        if filepath[-1:].isdigit():
            # path without the number
            fileprefix=filepath[:-1]

            # special case for 0 while numerotation can start at 1
            n = 0
            if path.isfile(fileprefix + str(n) + fileext):
                floppies.append(fileprefix + str(n) + fileext)

            # adding all other files
            n = 1
            while path.isfile(fileprefix + str(n) + fileext):
                floppies.append(fileprefix + str(n) + fileext)
                n += 1
        # (Disk 1 of 2) format
        elif indexDisk != -1 :
                # Several disks
                floppies.append(rom)
                prefix = filepath[0:indexDisk+6]
                postfix = filepath[indexDisk+7:]
                n = 2
                while path.isfile(prefix+str(n)+postfix+fileext):
                    floppies.append(prefix+str(n)+postfix+fileext)
                    n += 1
        else :
           #Single ADF
           return [rom]

        return floppies

    def getRomType(self,filepath) :
        extension = os.path.splitext(filepath)[1][1:].lower()

        if extension == "lha":
            return 'WHDL'
        elif extension == 'hdf' :
            return 'HDF'
        elif extension in ['iso','cue','chd'] :
            return 'CD'
        elif extension in ['iso','cue','chd','img','bin','nrg'] :
            return 'DISK'
        elif extension == "zip":
            # can be either whdl or adf
            with zipfile.ZipFile(filepath) as zip:
                for zipfilename in zip.namelist():
                    if zipfilename.find('/') == -1: # at the root
                        extension = os.path.splitext(zipfilename)[1][1:]
                        if extension == "info":
                            return 'WHDL'
                        elif extension == 'lha' :
                            eslog.warning("Amiberry doesn't support .lha inside a .zip")
                            return 'UNKNOWN'
                        elif extension in ['adf','ipf'] :
                            return 'DISK'
            # no info or adf file found
            return 'UNKNOWN'

        return 'UNKNOWN'
