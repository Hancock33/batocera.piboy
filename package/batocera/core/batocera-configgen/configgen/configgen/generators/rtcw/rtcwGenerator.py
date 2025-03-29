import os
import shutil
from os import path

from ... import batoceraFiles
from ... import Command
from ...controller import generate_sdl_game_controller_config
from ...utils import videoMode as videoMode
from ..Generator import Generator

rtcw_src = "/usr/bin/rtcw/main"
rtcw_dst = "/userdata/roms/ports/rtcw/main"

class RtcwGenerator(Generator):

    def getHotkeysContext(self):
        return {
            "name": "iortcw",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "menu": "KEY_ESC", "pause": "KEY_ESC", "save_state": "KEY_F5", "restore_state": "KEY_F9" }
        }

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):

        shutil.copytree(rtcw_src, rtcw_dst, dirs_exist_ok=True)

        # Config file path
        config_file_path = "/userdata/roms/ports/rtcw/main/wolfconfig.cfg"

        # Define the options to add or modify
        options_to_set = {
            "seta r_mode": "-1",
            "seta r_noborder": "1",
            "seta r_fullscreen": "1",
            "seta r_allowResize": "0",
            "seta r_centerWindow": "1",
            "seta r_inGameVideo": "1",
            "seta r_customheight": f'"{gameResolution["height"]}"',
            "seta r_customwidth": f'"{gameResolution["width"]}"',
            "seta in_joystick": "1",
            "seta in_joystickUseAnalog": "1",
            "bind PAD0_A": '"+moveup"',
            "bind PAD0_X": '"+movedown"',
            "bind PAD0_Y": '"+useitem"',
            "bind PAD0_B": '"+activate"',
            "bind PAD0_LEFTSHOULDER": 'weapnext',
            "bind PAD0_RIGHTSHOULDER": 'weapprev',
            "bind PAD0_LEFTSTICK_LEFT": '+moveleft',
            "bind PAD0_LEFTSTICK_RIGHT": '+moveright',
            "bind PAD0_LEFTSTICK_UP": '+forward',
            "bind PAD0_LEFTSTICK_DOWN": '+back',
            "bind PAD0_RIGHTSTICK_LEFT": '+left',
            "bind PAD0_RIGHTSTICK_RIGHT": '+right',
            "bind PAD0_RIGHTSTICK_UP": '+lookup',
            "bind PAD0_RIGHTSTICK_DOWN": '+lookdown',
            "bind PAD0_LEFTTRIGGER": '+speed',
            "bind PAD0_RIGHTTRIGGER": '+attack'
        }

        ## ES options
        # Graphics API
        options_to_set["seta cl_renderer"] = system.config.get("iortcw_api", "opengl1")
        # VSync
        options_to_set["seta r_swapInterval"] = system.config.get_bool("iortcw_vsync", return_values=("1", "0"))
        # Frame rate
        options_to_set["seta com_maxfps"] = system.config.get("iortcw_fps", "60")
        # Anisotropic filtering
        filtering = system.config.get("iortcw_filtering", "2")
        options_to_set["seta r_ext_texture_filter_anisotropic"] = "0" if filtering == "2" else "1"
        options_to_set["seta r_ext_max_anisotropy"] = filtering
        # Anti-aliasing
        aa = system.config.get("iortcw_aa", "0")
        options_to_set["seta r_ext_multisample"] = aa
        options_to_set["seta r_ext_framebuffer_multisample"] = aa

        # Skip intro video
        options_to_set["seta com_introplayed"] = system.config.get_bool("iortcw_skip_video", return_values=("1", "0"))

        # Set language
        options_to_set["seta cl_language"] = system.config.get("iortcw_language", "0")

        # Check if the file exists
        if os.path.isfile(config_file_path):
            with open(config_file_path, 'r') as config_file:
                lines = config_file.readlines()

            # Loop through the options and update the lines
            for key, value in options_to_set.items():
                option_exists = any(key in line for line in lines)
                if not option_exists:
                    lines.append(f"{key} \"{value}\"\n")
                else:
                    for i, line in enumerate(lines):
                        if key in line:
                            lines[i] = f"{key} \"{value}\"\n"

            # Write the modified content back to the file
            with open(config_file_path, 'w') as config_file:
                config_file.writelines(lines)
        else:
            # File doesn't exist, create it and add the options
            with open(config_file_path, 'w') as config_file:
                for key, value in options_to_set.items():
                    config_file.write(f"{key} \"{value}\"\n")

        # Single Player for now
        commandArray = ["/usr/bin/rtcw/iowolfsp"]

        # iortcw looks for roms in home + /rtcw
        return Command.Command(
            array=commandArray,
            env={
                "XDG_DATA_HOME": "/userdata/roms/ports",
                "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers)
            }
        )

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9
