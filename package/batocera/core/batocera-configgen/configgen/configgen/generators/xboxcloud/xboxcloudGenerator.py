from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class XboxcloudGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["/usr/bin/greenlight", "--no-sandbox", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
              'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
        })
