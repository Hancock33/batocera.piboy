#!/usr/bin/env python
from generators.Generator import Generator
import Command
import os
import controllersConfig
import json
import batoceraFiles

class YabasanshiroGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):

        yabaCtrl = {
            "start":          "start",
            "select":         "select",
            "a":              "b",
            "b":              "a",
            "pageup":         "c",
            "x":              "y",
            "y":              "x",
            "pagedown":       "z",
            "up":             "up",
            "down":           "down",
            "left":           "left",
            "right":          "right",
            "l2":             "l",
            "r2":             "r",
            "joystick1up":    "analogy",
            "joystick1left":  "analogx"
        }

        yabaConfig  = batoceraFiles.CONF + "/yabasanshiro"
        rom_file = os.path.basename(rom)
        config_file = f"{yabaConfig}/{rom_file}.config"
        ctrl_config_file = f"{yabaConfig}/keymapv2.json"

        # Check if the configuration file exists
        if os.path.exists(config_file):
            # Load the configuration file
            with open(config_file, 'r') as f:
                config = json.load(f)

        else:
            # Create a new configuration file with default values
            config = {
                "Aspect rate": 0,
                "Resolution": 0,
                "Rotate screen": False,
                "Rotate screen resolution": 0,
                "Use compute shader": False
            }
            with open(config_file, 'w') as f:
                json.dump(config, f, indent=2)

        # Modify the config file
        if system.isOptSet("yaba_aspect"):
            config["Aspect rate"] = int(system.config["yaba_aspect"])
        else:
            config["Aspect rate"] = 0
        if system.isOptSet("yaba_resolution"):
            config["Resolution"] = int(system.config["yaba_resolution"])
        else:
            config["Resolution"] = 3
        config["Rotate screen"] = False
        config["Rotate screen resolution"] = 0
        if system.isOptSet("yaba_shader"):
            config["Use compute shader"] = system.config["yaba_shader"]
        else:
            config["Use compute shader"] = False

        # Write the modified configuration file back to disk
        with open(config_file, 'w') as f:
            json.dump(config, f, indent=2)

        # Configure the first two controllers
        data = {}
        nplayer = 1
        for playercontroller, pad in sorted(playersControllers.items()):
            if nplayer <= 2:
                ctrl_id = str(pad.index) + "_" + pad.realName + "_" + pad.guid
                if ctrl_id not in data:
                    data[ctrl_id] = {}

                player_index = int(pad.index + 1)
                if system.isOptSet("yaba_player" + str(player_index)):
                    pad_mode = int(system.config["yaba_player" + str(player_index)])
                else:
                    pad_mode = 0

                player = "player" + str(player_index)
                if player not in data:
                    data[player] = {}
                data[player] = {
                    "DeviceID": int(pad.index),
                    "deviceGUID": pad.guid,
                    "deviceName": pad.realName,
                    "padmode": pad_mode
                }
                for x in pad.inputs:
                    input = pad.inputs[x]
                    if input.name in yabaCtrl:
                        if input.name == "joystick1left":
                            data[ctrl_id]["analogleft"] = {
                                "id": 4,
                                "type": "axis",
                                "value": 0
                            }
                            data[ctrl_id]["analogright"] = {
                                "id": 5,
                                "type": "axis",
                                "value": 0
                            }
                        data[ctrl_id][yabaCtrl[input.name]] = {
                            "id": int(input.id),
                            "type": input.type,
                            "value": int(input.value)
                        }
                nplayer += 1

        # Write the final controller json file
        with open(ctrl_config_file, 'w') as f:
            json.dump(data, f, indent=2)

        commandArray = ["/usr/bin/yabasanshiro/yabasanshiro", "-i", rom]

        return Command.Command(
            array=commandArray,
            env={ "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)}
            )
