#!/usr/bin/env python

from generators.Generator import Generator
import Command
import os
from os import environ
import batoceraFiles
import controllersConfig
import filecmp
import json
import shutil
import evdev
from evdev import InputDevice

ryujinxConf = batoceraFiles.CONF + "/Ryujinx"
ryujinxConfFile = ryujinxConf + "/Config.json"
ryujinxKeys = batoceraFiles.BIOS + "/switch/prod.keys"
ryujinxExec = ryujinxConf + "/ryujinx"

ryujinxCtrl = {
      "left_joycon_stick": {
        "stick_up": "W",
        "stick_down": "S",
        "stick_left": "A",
        "stick_right": "D",
        "stick_button": "F"
      },
      "right_joycon_stick": {
        "stick_up": "I",
        "stick_down": "K",
        "stick_left": "J",
        "stick_right": "L",
        "stick_button": "H"
      },
      "left_joycon": {
        "button_minus": "Minus",
        "button_l": "E",
        "button_zl": "Q",
        "button_sl": "Unbound",
        "button_sr": "Unbound",
        "dpad_up": "Up",
        "dpad_down": "Down",
        "dpad_left": "Left",
        "dpad_right": "Right"
      },
      "right_joycon": {
        "button_plus": "Plus",
        "button_r": "U",
        "button_zr": "O",
        "button_sl": "Unbound",
        "button_sr": "Unbound",
        "button_x": "C",
        "button_b": "X",
        "button_y": "V",
        "button_a": "Z"
      },
      "version": 1,
      "backend": "WindowKeyboard",
      "id": "0",
      "controller_type": "JoyconPair",
      "player_index": "Player1"
}

class RyujinxGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        if not os.path.exists(ryujinxConf):
            os.makedirs(ryujinxConf)
        if not os.path.exists(ryujinxConf + "/system"):
            os.makedirs(ryujinxConf + "/system")

        # Copy file & make executable (workaround)
        if not os.path.exists(ryujinxExec) or not filecmp.cmp("/usr/ryujinx/Ryujinx", ryujinxExec):
            shutil.copyfile("/usr/ryujinx/Ryujinx", ryujinxExec)
            os.chmod(ryujinxExec, 0o0775)

        # Copy the prod.keys file to where ryujinx reads it
        if os.path.exists(ryujinxKeys):
            shutil.copyfile(ryujinxKeys, ryujinxConf + "/system/prod.keys")

        # [Configuration]
        if not os.path.exists(os.path.dirname(ryujinxConfFile)):
            os.makedirs(os.path.dirname(ryujinxConfFile))
        try:
            conf = json.load(open(ryujinxConfFile, "r"))
        except:
            conf = {}

        # Set defaults
        conf["enable_discord_integration"] = False
        conf["check_updates_on_start"] = False
        conf["show_confirm_exit"] = False
        conf["hide_cursor_on_idle"] = True
        conf["game_dirs"] = ["/userdata/roms/switch"]
        conf["start_fullscreen"] = True
        conf["docked_mode"] = True
        # set ryujinx app language
        conf["language_code"] = str(getLangFromEnvironment())

        # Console language, time & date
        if system.isOptSet("ryujinx_language"):
            conf["system_language"] = system.config["ryujinx_language"]
        else:
            conf["system_language"] = "AmericanEnglish"

        if system.isOptSet("ryujinx_region"):
            conf["system_region"] = system.config["ryujinx_region"]
        else:
            conf["system_region"] = "USA"

        conf["system_time_zone"] = "UTC"
        if system.isOptSet("ryujinx_timeoffset"):
            conf["system_time_offset"] = int(system.config["ryujinx_timeoffset"])
        else:
            conf["system_time_offset"]= 0

        # Graphics
        if system.isOptSet("ryujinx_api"):
            conf["graphics_backend"] = system.config["ryujinx_api"]
        else:
            conf["graphics_backend"] = "Vulkan"

        if system.isOptSet("ryujinx_scale"):
            conf["res_scale"] = int(system.config["ryujinx_scale"])
        else:
            conf["res_scale"] = 1

        if system.isOptSet("ryujinx_ratio"):
            conf["aspect_ratio"] = system.config["ryujinx_ratio"]
        else:
            conf["aspect_ratio"] = "Fixed16x9"

        if system.isOptSet("ryujinx_filtering"):
            conf["max_anisotropy"] = int(system.config["ryujinx_filtering"])
        else:
            conf["max_anisotropy"] = -1

        conf["input_config"] = []

        # write / update the config file
        js_out = json.dumps(conf, indent=2)
        with open(ryujinxConfFile, "w") as jout:
            jout.write(js_out)

        # Now add Controllers
        writeControllerIntoJson(ryujinxCtrl)

        if rom == "config":
            commandArray = [ryujinxExec]
        else:
            commandArray = [ryujinxExec, rom]

        return Command.Command(
            array=commandArray,
            env={"XDG_CONFIG_HOME":batoceraFiles.CONF, \
            "XDG_DATA_HOME":batoceraFiles.SAVES + "/switch", \
            "XDG_CACHE_HOME":batoceraFiles.CACHE, \
            "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)})

def writeControllerIntoJson(new_controller, filename=ryujinxConfFile):
    with open(filename,'r+') as file:
        file_data = json.load(file)
        file_data["input_config"].append(new_controller)
        file.seek(0)
        json.dump(file_data, file, indent=2)

def getLangFromEnvironment():
    lang = environ['LANG'][:5]
    availableLanguages = { "jp_JP": 0, "en_US": 1, "de_DE": 2,
                           "fr_FR": 3, "es_ES": 4, "it_IT": 5,
                           "nl_NL": 6, "zh_CN": 7, "zh_TW": 8, "ko_KR": 9 }
    if lang in availableLanguages:
        return availableLanguages[lang]
    else:
        return availableLanguages["en_US"]
