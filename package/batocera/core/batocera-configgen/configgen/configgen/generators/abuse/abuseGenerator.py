from ... import Command
from ... import controllersConfig
from ..Generator import Generator

class AbuseGenerator(Generator):
    if os.path.isfile('/tmp/piboy'):
        os.system('piboy_keys abuse.keys')

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["abuse", "-datadir", "/usr/share/abuse"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
