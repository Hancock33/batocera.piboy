import os.path, shutil
import configparser

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class DosBoxxGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        # Find rom path
        gameDir = rom
        batFile = gameDir + "/dosbox.bat"
        gameConfFile = gameDir + "/dosbox.cfg"

        configFile = batoceraFiles.dosboxxConfig
        if os.path.isfile(gameConfFile):
            configFile = gameConfFile

        # configuration file
        iniSettings = configparser.ConfigParser(interpolation=None)
        # To prevent ConfigParser from converting to lower case
        iniSettings.optionxform = str

        # copy config file to custom config file to avoid overwritting by dosbox-x
        customConfFile = os.path.join(batoceraFiles.dosboxxCustom,'dosboxx-custom.conf')

        if os.path.exists(configFile):
            shutil.copy2(configFile, customConfFile)
            iniSettings.read(customConfFile)

        # sections
        if not iniSettings.has_section("sdl"):
            iniSettings.add_section("sdl")
        iniSettings.set("sdl", "output", "opengl")

        # save
        with open(customConfFile, 'w') as config:
            iniSettings.write(config)

        # -fullscreen removed as it crashes on N2
        commandArray = [batoceraFiles.batoceraBins[system.config['emulator']],
			"-exit",
			"-c", f"""mount c {gameDir}""",
                        "-c", "c:",
                        "-c", "dosbox.bat",
                        "-fastbioslogo",
                        f"-conf {customConfFile}"]

        return Command.Command(array=commandArray, env={"XDG_CONFIG_HOME":batoceraFiles.CONF})

    def getHotkeysContext(self):
        return {
            "name": "dosboxx",
            "keys": { "exit": ["KEY_LEFTCTRL", "KEY_F9"] }
        }
