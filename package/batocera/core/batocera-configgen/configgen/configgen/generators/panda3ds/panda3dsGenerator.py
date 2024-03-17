#!/usr/bin/env python

import Command
import batoceraFiles # GLOBAL VARIABLES
from generators.Generator import Generator
import shutil
import os
from os import environ
import configparser
import controllersConfig
import subprocess

from utils.logger import get_logger
eslog = get_logger(__name__)

class Panda3dsGenerator(Generator):

    # Main entry of the module
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        Panda3dsGenerator.writePandaConfig(batoceraFiles.CONF + "/panda3ds-emu/qt-config.ini", system, playersControllers)

        if os.path.exists('/usr/bin/panda3ds-qt'):
            commandArray = ['/usr/bin/panda3ds-qt', rom]
        else:
            commandArray = ['/usr/bin/panda3ds', rom]
        return Command.Command(array=commandArray, env={
            "XDG_CONFIG_HOME":batoceraFiles.CONF,
            "XDG_DATA_HOME":batoceraFiles.SAVES + "/3ds",
            "XDG_CACHE_HOME":batoceraFiles.CACHE,
            "XDG_RUNTIME_DIR":batoceraFiles.SAVES + "/3ds/panda3ds-emu",
            "QT_QPA_PLATFORM":"xcb",
            "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers),
            "SDL_JOYSTICK_HIDAPI": "0"
            }
        )

    # Show mouse on screen
    def getMouseMode(self, config, rom):
        if "panda3ds_screen_layout" in config and config["panda3ds_screen_layout"] == "1-false":
            return False
        else:
            return True

    @staticmethod
    def writePandaConfig(panda3dsConfigFile, system, playersControllers):
        # Pads
        panda3dsButtons = {
            "button_a":      "a",
            "button_b":      "b",
            "button_x":      "x",
            "button_y":      "y",
            "button_up":     "up",
            "button_down":   "down",
            "button_left":   "left",
            "button_right":  "right",
            "button_l":      "pageup",
            "button_r":      "pagedown",
            "button_start":  "start",
            "button_select": "select",
            "button_zl":     "l2",
            "button_zr":     "r2",
            "button_home":   "hotkey"
        }

        panda3dsAxis = {
            "circle_pad":    "joystick1",
            "c_stick":       "joystick2"
        }

        # ini file
        panda3dsConfig = configparser.RawConfigParser(strict=False)
        panda3dsConfig.optionxform=str             # Add Case Sensitive comportement
        if os.path.exists(panda3dsConfigFile):
            panda3dsConfig.read(panda3dsConfigFile)

        ## [LAYOUT]
        if not panda3dsConfig.has_section("Layout"):
            panda3dsConfig.add_section("Layout")
        # Screen Layout
        panda3dsConfig.set("Layout", "custom_layout", "false")
        panda3dsConfig.set("Layout", "custom_layout\default", "true")
        if system.isOptSet('panda3ds_screen_layout'):
            tab = system.config["panda3ds_screen_layout"].split('-')
            panda3dsConfig.set("Layout", "swap_screen",   tab[1])
            panda3dsConfig.set("Layout", "layout_option", tab[0])
        else:
            panda3dsConfig.set("Layout", "swap_screen", "false")
            panda3dsConfig.set("Layout", "layout_option", "0")
        panda3dsConfig.set("Layout", "swap_screen\default", "false")
        panda3dsConfig.set("Layout", "layout_option\default", "false")

        ## [SYSTEM]
        if not panda3dsConfig.has_section("System"):
            panda3dsConfig.add_section("System")
        # New 3DS Version
        if system.isOptSet('panda3ds_is_new_3ds') and system.config["panda3ds_is_new_3ds"] == '1':
            panda3dsConfig.set("System", "is_new_3ds", "true")
        else:
            panda3dsConfig.set("System", "is_new_3ds", "false")
        panda3dsConfig.set("System", "is_new_3ds\default", "false")
        # Language
        panda3dsConfig.set("System", "region_value", str(getPanda3dsLangFromEnvironment()))
        panda3dsConfig.set("System", "region_value\default", "false")

        ## [UI]
        if not panda3dsConfig.has_section("UI"):
            panda3dsConfig.add_section("UI")
        # Start Fullscreen
        panda3dsConfig.set("UI", "fullscreen", "true")
        panda3dsConfig.set("UI", "fullscreen\default", "false")

        # Batocera - Defaults
        panda3dsConfig.set("UI", "displayTitleBars", "false")
        panda3dsConfig.set("UI", "displaytitlebars", "false") # Emulator Bug
        panda3dsConfig.set("UI", "displayTitleBars\default", "false")
        panda3dsConfig.set("UI", "firstStart", "false")
        panda3dsConfig.set("UI", "firstStart\default", "false")
        panda3dsConfig.set("UI", "hideInactiveMouse", "true")
        panda3dsConfig.set("UI", "hideInactiveMouse\default", "false")
        panda3dsConfig.set("UI", "enable_discord_presence", "false")
        panda3dsConfig.set("UI", "enable_discord_presence\default", "false")

        # Remove pop-up prompt on start
        panda3dsConfig.set("UI", "calloutFlags", "1")
        panda3dsConfig.set("UI", "calloutFlags\default", "false")
        # Close without confirmation
        panda3dsConfig.set("UI", "confirmClose", "false")
        panda3dsConfig.set("UI", "confirmclose", "false") # Emulator Bug
        panda3dsConfig.set("UI", "confirmClose\default", "false")

        # screenshots
        panda3dsConfig.set("UI", "Paths\screenshotPath", "/userdata/screenshots")
        panda3dsConfig.set("UI", "Paths\screenshotPath\default", "false")

        # don't check updates
        panda3dsConfig.set("UI", "Updater\check_for_update_on_start", "false")
        panda3dsConfig.set("UI", "Updater\check_for_update_on_start\default", "false")

        ## [RENDERER]
        if not panda3dsConfig.has_section("Renderer"):
            panda3dsConfig.add_section("Renderer")
        # Force Hardware Rrendering / Shader or nothing works fine
        panda3dsConfig.set("Renderer", "use_hw_renderer", "true")
        panda3dsConfig.set("Renderer", "use_hw_shader",   "true")
        panda3dsConfig.set("Renderer", "use_shader_jit",  "true")
        # Software, OpenGL (default) or Vulkan
        if system.isOptSet('panda3ds_graphics_api'):
            panda3dsConfig.set("Renderer", "graphics_api", system.config["panda3ds_graphics_api"])
        else:
            panda3dsConfig.set("Renderer", "graphics_api", "1")
        # Set Vulkan as necessary
        if system.isOptSet("panda3ds_graphics_api") and system.config["panda3ds_graphics_api"] == "2":
            try:
                have_vulkan = subprocess.check_output(["/usr/bin/batocera-vulkan", "hasVulkan"], text=True).strip()
                if have_vulkan == "true":
                    eslog.debug("Vulkan driver is available on the system.")
                    try:
                        have_discrete = subprocess.check_output(["/usr/bin/batocera-vulkan", "hasDiscrete"], text=True).strip()
                        if have_discrete == "true":
                            eslog.debug("A discrete GPU is available on the system. We will use that for performance")
                            try:
                                discrete_index = subprocess.check_output(["/usr/bin/batocera-vulkan", "discreteIndex"], text=True).strip()
                                if discrete_index != "":
                                    eslog.debug("Using Discrete GPU Index: {} for Panda3ds".format(discrete_index))
                                    panda3dsConfig.set("Renderer", "physical_device", discrete_index)
                                else:
                                    eslog.debug("Couldn't get discrete GPU index")
                            except subprocess.CalledProcessError:
                                eslog.debug("Error getting discrete GPU index")
                        else:
                            eslog.debug("Discrete GPU is not available on the system. Using default.")
                    except subprocess.CalledProcessError:
                        eslog.debug("Error checking for discrete GPU.")
            except subprocess.CalledProcessError:
                eslog.debug("Error executing batocera-vulkan script.")
        # Use VSYNC
        if system.isOptSet('panda3ds_use_vsync_new') and system.config["panda3ds_use_vsync_new"] == '0':
            panda3dsConfig.set("Renderer", "use_vsync_new", "false")
        else:
            panda3dsConfig.set("Renderer", "use_vsync_new", "true")
        panda3dsConfig.set("Renderer", "use_vsync_new\default", "true")
        # Resolution Factor
        if system.isOptSet('panda3ds_resolution_factor'):
            panda3dsConfig.set("Renderer", "resolution_factor", system.config["panda3ds_resolution_factor"])
        else:
            panda3dsConfig.set("Renderer", "resolution_factor", "1")
        panda3dsConfig.set("Renderer", "resolution_factor\default", "false")
        # Async Shader Compilation
        if system.isOptSet('panda3ds_async_shader_compilation') and system.config["panda3ds_async_shader_compilation"] == '1':
            panda3dsConfig.set("Renderer", "async_shader_compilation", "true")
        else:
            panda3dsConfig.set("Renderer", "async_shader_compilation", "false")
        panda3dsConfig.set("Renderer", "async_shader_compilation\default", "false")
        # Use Frame Limit
        if system.isOptSet('panda3ds_use_frame_limit') and system.config["panda3ds_use_frame_limit"] == '0':
            panda3dsConfig.set("Renderer", "use_frame_limit", "false")
        else:
            panda3dsConfig.set("Renderer", "use_frame_limit", "true")

        ## [WEB SERVICE]
        if not panda3dsConfig.has_section("WebService"):
            panda3dsConfig.add_section("WebService")
        panda3dsConfig.set("WebService", "enable_telemetry",  "false")

        ## [UTILITY]
        if not panda3dsConfig.has_section("Utility"):
            panda3dsConfig.add_section("Utility")
        # Disk Shader Cache
        if system.isOptSet('panda3ds_use_disk_shader_cache') and system.config["panda3ds_use_disk_shader_cache"] == '1':
            panda3dsConfig.set("Utility", "use_disk_shader_cache", "true")
        else:
            panda3dsConfig.set("Utility", "use_disk_shader_cache", "false")
        panda3dsConfig.set("Utility", "use_disk_shader_cache\default", "false")
        # Custom Textures
        if system.isOptSet('panda3ds_custom_textures') and system.config["panda3ds_custom_textures"] != '0':
            tab = system.config["panda3ds_custom_textures"].split('-')
            panda3dsConfig.set("Utility", "custom_textures",  "true")
            if tab[1] == 'normal':
                panda3dsConfig.set("Utility", "preload_textures", "false")
            else:
                panda3dsConfig.set("Utility", "preload_textures", "true") # It's not working from ES for now, only from the emulator menu
        else:
            panda3dsConfig.set("Utility", "custom_textures",  "false")
            panda3dsConfig.set("Utility", "preload_textures", "false")

        ## [CONTROLS]
        if not panda3dsConfig.has_section("Controls"):
            panda3dsConfig.add_section("Controls")

        # Options required to load the functions when the configuration file is created
        if not panda3dsConfig.has_option("Controls", "profiles\\size"):
            panda3dsConfig.set("Controls", "profile", 0)
            panda3dsConfig.set("Controls", "profile\\default", "true")
            panda3dsConfig.set("Controls", "profiles\\1\\name", "default")
            panda3dsConfig.set("Controls", "profiles\\1\\name\\default", "true")
            panda3dsConfig.set("Controls", "profiles\\size", 1)

        for index in playersControllers :
            controller = playersControllers[index]
            # We only care about player 1
            if controller.player != "1":
                continue
            for x in panda3dsButtons:
                panda3dsConfig.set("Controls", "profiles\\1\\" + x, f'"{Panda3dsGenerator.setButton(panda3dsButtons[x], controller.guid, controller.inputs)}"')
            for x in panda3dsAxis:
                panda3dsConfig.set("Controls", "profiles\\1\\" + x, f'"{Panda3dsGenerator.setAxis(panda3dsAxis[x], controller.guid, controller.inputs)}"')
            break

        ## Update the configuration file
        if not os.path.exists(os.path.dirname(panda3dsConfigFile)):
            os.makedirs(os.path.dirname(panda3dsConfigFile))
        with open(panda3dsConfigFile, 'w') as configfile:
            panda3dsConfig.write(configfile)

    @staticmethod
    def setButton(key, padGuid, padInputs):
        # It would be better to pass the joystick num instead of the guid because 2 joysticks may have the same guid
        if key in padInputs:
            input = padInputs[key]

            if input.type == "button":
                return ("button:{},guid:{},engine:sdl").format(input.id, padGuid)
            elif input.type == "hat":
                return ("engine:sdl,guid:{},hat:{},direction:{}").format(padGuid, input.id, Panda3dsGenerator.hatdirectionvalue(input.value))
            elif input.type == "axis":
                # Untested, need to configure an axis as button / triggers buttons to be tested too
                return ("engine:sdl,guid:{},axis:{},direction:{},threshold:{}").format(padGuid, input.id, "+", 0.5)

    @staticmethod
    def setAxis(key, padGuid, padInputs):
        inputx = None
        inputy = None

        if key == "joystick1" and "joystick1left" in padInputs:
            inputx = padInputs["joystick1left"]
        elif key == "joystick2" and "joystick2left" in padInputs:
            inputx = padInputs["joystick2left"]

        if key == "joystick1" and "joystick1up" in padInputs:
            inputy = padInputs["joystick1up"]
        elif key == "joystick2" and "joystick2up" in padInputs:
            inputy = padInputs["joystick2up"]

        if inputx is None or inputy is None:
            return "";

        return ("axis_x:{},guid:{},axis_y:{},engine:sdl").format(inputx.id, padGuid, inputy.id)

    @staticmethod
    def hatdirectionvalue(value):
        if int(value) == 1:
            return "up"
        if int(value) == 4:
            return "down"
        if int(value) == 2:
            return "right"
        if int(value) == 8:
            return "left"
        return "unknown"

# Language auto setting
def getPanda3dsLangFromEnvironment():
    region = { "AUTO": -1, "JPN": 0, "USA": 1, "EUR": 2, "AUS": 3, "CHN": 4, "KOR": 5, "TWN": 6 }
    availableLanguages = {
        "ja_JP": "JPN",
        "en_US": "USA",
        "de_DE": "EUR",
        "es_ES": "EUR",
        "fr_FR": "EUR",
        "it_IT": "EUR",
        "hu_HU": "EUR",
        "pt_PT": "EUR",
        "ru_RU": "EUR",
        "en_AU": "AUS",
        "zh_CN": "CHN",
        "ko_KR": "KOR",
        "zh_TW": "TWN"
    }
    lang = environ['LANG'][:5]
    if lang in availableLanguages:
        return region[availableLanguages[lang]]
    else:
        return region["AUTO"]
