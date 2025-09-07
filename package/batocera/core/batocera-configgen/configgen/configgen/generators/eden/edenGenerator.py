from __future__ import annotations

import logging
from os import environ
from typing import TYPE_CHECKING, Final

from ... import Command
from ...batoceraPaths import CACHE, CONFIGS, SAVES, ensure_parents_and_open, mkdir_if_not_exists
from ...utils import vulkan
from ...utils.configparser import CaseSensitiveRawConfigParser
from ..Generator import Generator

if TYPE_CHECKING:
    from pathlib import Path

    from ...controller import Controllers
    from ...Emulator import Emulator
    from ...input import InputMapping
    from ...types import HotkeysContext

_logger = logging.getLogger(__name__)

EDEN_CONFIG: Final = CONFIGS / 'yuzu'

class EdenGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "eden",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        mkdir_if_not_exists(EDEN_CONFIG)

        EdenGenerator.writeEdenConfig(EDEN_CONFIG / "qt-config.ini", system, playersControllers)

        commandArray = ["/usr/bin/eden", "-f", "-g", rom]
        return Command.Command(array=commandArray, env={
            "XDG_CONFIG_HOME": CONFIGS,
            "XDG_DATA_HOME": SAVES / "switch",
            "XDG_CACHE_HOME": CACHE,
            "USER": "root"
            }
        )

    @staticmethod
    def writeEdenConfig(edenConfigFile: Path, system: Emulator, playersControllers: Controllers):
        # pads
        edenButtonsMapping = {
            "button_a":      "a",
            "button_b":      "b",
            "button_x":      "x",
            "button_y":      "y",
            "button_dup":    "up",
            "button_ddown":  "down",
            "button_dleft":  "left",
            "button_dright": "right",
            "button_l":      "pageup",
            "button_r":      "pagedown",
            "button_plus":   "start",
            "button_minus":  "select",
            "button_sl":     "l",
            "button_sr":     "r",
            "button_zl":     "l2",
            "button_zr":     "r2",
            "button_lstick": "l3",
            "button_rstick": "r3",
            "button_home":   "hotkey"
        }

        edenAxisMapping = {
            "lstick":    "joystick1",
            "rstick":    "joystick2"
        }

        # ini file
        edenConfig = CaseSensitiveRawConfigParser()
        if edenConfigFile.exists():
            edenConfig.read(edenConfigFile)

        # UI section
        if not edenConfig.has_section("UI"):
            edenConfig.add_section("UI")
        edenConfig.set("UI", "fullscreen", "true")
        edenConfig.set("UI", "fullscreen\\default", "true")
        edenConfig.set("UI", "confirmClose", "false")
        edenConfig.set("UI", "confirmClose\\default", "false")
        edenConfig.set("UI", "firstStart", "false")
        edenConfig.set("UI", "firstStart\\default", "false")
        edenConfig.set("UI", "displayTitleBars", "false")
        edenConfig.set("UI", "displayTitleBars\\default", "false")
        edenConfig.set("UI", "enable_discord_presence", "false")
        edenConfig.set("UI", "enable_discord_presence\\default", "false")
        edenConfig.set("UI", "calloutFlags", "1")
        edenConfig.set("UI", "calloutFlags\\default", "false")
        edenConfig.set("UI", "confirmStop", "2")
        edenConfig.set("UI", "confirmStop\\default", "false")

        # Single Window Mode
        edenConfig.set("UI", "singleWindowMode", system.config.get("eden_single_window", "true"))
        edenConfig.set("UI", "singleWindowMode\\default", "false")

        edenConfig.set("UI", "hideInactiveMouse", "true")
        edenConfig.set("UI", "hideInactiveMouse\\default", "false")

        # Roms path (need for load update/dlc)
        edenConfig.set("UI", "Paths\\gamedirs\\1\\deep_scan", "true")
        edenConfig.set("UI", "Paths\\gamedirs\\1\\deep_scan\\default", "false")
        edenConfig.set("UI", "Paths\\gamedirs\\1\\expanded", "true")
        edenConfig.set("UI", "Paths\\gamedirs\\1\\expanded\\default", "false")
        edenConfig.set("UI", "Paths\\gamedirs\\1\\path", "/userdata/roms/switch")
        edenConfig.set("UI", "Paths\\gamedirs\\size", "1")

        edenConfig.set("UI", "Screenshots\\enable_screenshot_save_as", "true")
        edenConfig.set("UI", "Screenshots\\enable_screenshot_save_as\\default", "false")
        edenConfig.set("UI", "Screenshots\\screenshot_path", "/userdata/screenshots")
        edenConfig.set("UI", "Screenshots\\screenshot_path\\default", "false")

        # Change controller exit
        edenConfig.set("UI", "Shortcuts\\Main%20Window\\Continue\\Pause%20Emulation\\Controller_KeySeq", "Home+Minus")
        edenConfig.set("UI", "Shortcuts\\Main%20Window\\Exit%20eden\\Controller_KeySeq", "Home+Plus")

        # Data Storage section
        if not edenConfig.has_section("Data%20Storage"):
            edenConfig.add_section("Data%20Storage")
        edenConfig.set("Data%20Storage", "dump_directory", "/userdata/system/configs/eden/dump")
        edenConfig.set("Data%20Storage", "dump_directory\\default", "false")

        edenConfig.set("Data%20Storage", "load_directory", "/userdata/system/configs/eden/load")
        edenConfig.set("Data%20Storage", "load_directory\\default", "false")

        edenConfig.set("Data%20Storage", "nand_directory", "/userdata/system/configs/eden/nand")
        edenConfig.set("Data%20Storage", "nand_directory\\default", "false")

        edenConfig.set("Data%20Storage", "sdmc_directory", "/userdata/system/configs/eden/sdmc")
        edenConfig.set("Data%20Storage", "sdmc_directory\\default", "false")

        edenConfig.set("Data%20Storage", "tas_directory", "/userdata/system/configs/eden/tas")
        edenConfig.set("Data%20Storage", "tas_directory\\default", "false")

        edenConfig.set("Data%20Storage", "use_virtual_sd", "true")
        edenConfig.set("Data%20Storage", "use_virtual_sd\\default", "false")

        # Core section
        if not edenConfig.has_section("Core"):
            edenConfig.add_section("Core")

        # Multicore
        edenConfig.set("Core", "use_multi_core", "true")
        edenConfig.set("Core", "use_multi_core\\default", "false")

        # Renderer section
        if not edenConfig.has_section("Renderer"):
            edenConfig.add_section("Renderer")

        # Aspect ratio
        edenConfig.set("Renderer", "aspect_ratio", system.config.get("eden_ratio", "0"))
        edenConfig.set("Renderer", "aspect_ratio\\default", "false")

        # Graphical backend
        if backend := system.config.get('eden_backend'):
            edenConfig.set("Renderer", "backend", backend)
            # Add vulkan logic
            if backend == "1" and vulkan.is_available():
                _logger.debug("Vulkan driver is available on the system.")
                if vulkan.has_discrete_gpu():
                    _logger.debug("A discrete GPU is available on the system. We will use that for performance")
                    discrete_index = vulkan.get_discrete_gpu_index()
                    if discrete_index:
                        _logger.debug("Using Discrete GPU Index: %s for Eden", discrete_index)
                        edenConfig.set("Renderer", "vulkan_device", discrete_index)
                        edenConfig.set("Renderer", "vulkan_device\\default", "true")
                    else:
                        _logger.debug("Couldn't get discrete GPU index, using default")
                        edenConfig.set("Renderer", "vulkan_device", "0")
                        edenConfig.set("Renderer", "vulkan_device\\default", "true")
                else:
                    _logger.debug("Discrete GPU is not available on the system. Using default.")
                    edenConfig.set("Renderer", "vulkan_device", "0")
                    edenConfig.set("Renderer", "vulkan_device\\default", "true")
        else:
            edenConfig.set("Renderer", "backend", "0")
        edenConfig.set("Renderer", "backend\\default", "false")

        # Async Shader compilation
        edenConfig.set("Renderer", "use_asynchronous_shaders", system.config.get("eden_async_shaders", "true"))
        edenConfig.set("Renderer", "use_asynchronous_shaders\\default", "false")

        # Assembly shaders
        edenConfig.set("Renderer", "shader_backend", system.config.get("eden_shaderbackend", "0"))
        edenConfig.set("Renderer", "shader_backend\\default", "false")

        # Async Gpu Emulation
        edenConfig.set("Renderer", "use_asynchronous_gpu_emulation", system.config.get("eden_async_gpu", "true"))
        edenConfig.set("Renderer", "use_asynchronous_gpu_emulation\\default", "false")

        # NVDEC Emulation
        edenConfig.set("Renderer", "nvdec_emulation", system.config.get("eden_nvdec_emu", "2"))
        edenConfig.set("Renderer", "nvdec_emulation\\default", "false")

        # GPU Accuracy
        edenConfig.set("Renderer", "gpu_accuracy", system.config.get("eden_accuracy", "0"))
        edenConfig.set("Renderer", "gpu_accuracy\\default", "true")

        # Vsync
        edenConfig.set("Renderer", "use_vsync", system.config.get("eden_vsync", "1"))
        edenConfig.set("Renderer", "use_vsync\\default", "false")

        # Max anisotropy
        edenConfig.set("Renderer", "max_anisotropy", system.config.get("eden_anisotropy", "0"))
        edenConfig.set("Renderer", "max_anisotropy\\default", "false")

        # Resolution scaler
        edenConfig.set("Renderer", "resolution_setup", system.config.get("eden_scale", "2"))
        edenConfig.set("Renderer", "resolution_setup\\default", "false")

        # Scaling filter
        edenConfig.set("Renderer", "scaling_filter", system.config.get("eden_scale_filter", "1"))
        edenConfig.set("Renderer", "scaling_filter\\default", "false")

        # Anti aliasing method
        edenConfig.set("Renderer", "anti_aliasing", system.config.get("eden_aliasing_method", "0"))
        edenConfig.set("Renderer", "anti_aliasing\\default", "false")

        # CPU Section
        if not edenConfig.has_section("Cpu"):
            edenConfig.add_section("Cpu")

        # CPU Accuracy
        edenConfig.set("Cpu", "cpu_accuracy", system.config.get("eden_cpuaccuracy", "0"))
        edenConfig.set("Cpu", "cpu_accuracy\\default", "false")

        # System section
        if not edenConfig.has_section("System"):
            edenConfig.add_section("System")

        # Language
        edenConfig.set("System", "language_index", system.config.get("eden_language") or str(EdenGenerator.getEdenLangFromEnvironment()))
        edenConfig.set("System", "language_index\\default", "false")

        # Region
        edenConfig.set("System", "region_index", system.config.get("eden_region") or str(EdenGenerator.getEdenRegionFromEnvironment()))
        edenConfig.set("System", "region_index\\default", "false")

         # controls section
        if not edenConfig.has_section("Controls"):
            edenConfig.add_section("Controls")

        # Dock Mode
        edenConfig.set("Controls", "use_docked_mode", system.config.get("eden_dock_mode", "true"))
        edenConfig.set("Controls", "use_docked_mode\\default", "false")

        # Sound Mode
        edenConfig.set("Controls", "sound_index", system.config.get("eden_sound_mode", "1"))
        edenConfig.set("Controls", "sound_index\\default", "false")

        # Timezone
        edenConfig.set("Controls", "time_zone_index", system.config.get("eden_timezone", "0"))
        edenConfig.set("Controls", "time_zone_index\\default", "false")

        # controllers
        for nplayer, pad in enumerate(playersControllers):
            edenConfig.set("Controls", f"player_{nplayer}_type", system.config.get(f"p{nplayer+1}_pad", "0"))
            edenConfig.set("Controls", rf"player_{nplayer}_type\default", "false")

            for x in edenButtonsMapping:
                edenConfig.set("Controls", f"player_{nplayer}_{x}", f'"{EdenGenerator.setButton(edenButtonsMapping[x], pad.guid, pad.inputs, nplayer)}"')
            for x in edenAxisMapping:
                edenConfig.set("Controls", f"player_{nplayer}_{x}", f'"{EdenGenerator.setAxis(edenAxisMapping[x], pad.guid, pad.inputs, nplayer)}"')
            edenConfig.set("Controls", f"player_{nplayer}_motionleft", '"[empty]"')
            edenConfig.set("Controls", f"player_{nplayer}_motionright", '"[empty]"')
            edenConfig.set("Controls", f"player_{nplayer}_connected", "true")
            edenConfig.set("Controls", f"player_{nplayer}_connected\\default", "false")
            edenConfig.set("Controls", f"player_{nplayer}_vibration_enabled", "true")
            edenConfig.set("Controls", f"player_{nplayer}_vibration_enabled\\default", "false")

        edenConfig.set("Controls", "vibration_enabled", "true")
        edenConfig.set("Controls", "vibration_enabled\\default", "false")

        for y in range(len(playersControllers), 9):
            edenConfig.set("Controls", f"player_{y-1}_connected", "true")
            edenConfig.set("Controls", rf"player_{y-1}_connected\default", "false")

        # telemetry section
        if not edenConfig.has_section("WebService"):
            edenConfig.add_section("WebService")
        edenConfig.set("WebService", "enable_telemetry", "false")
        edenConfig.set("WebService", "enable_telemetry\\default", "false")

        # Services section
        if not edenConfig.has_section("Services"):
            edenConfig.add_section("Services")
        edenConfig.set("Services", "bcat_backend", "none")
        edenConfig.set("Services", "bcat_backend\\default", "none")

        ### update the configuration file
        with ensure_parents_and_open(edenConfigFile, 'w') as configfile:
            edenConfig.write(configfile)

    @staticmethod
    def setButton(key: str, padGuid: str, padInputs: InputMapping, port: int) -> str:
        # it would be better to pass the joystick num instead of the guid because 2 joysticks may have the same guid
        if key in padInputs:
            input = padInputs[key]

            if input.type == "button":
                return f"engine:sdl,button:{input.id},guid:{padGuid},port:{port}"
            if input.type == "hat":
                return f"engine:sdl,hat:{input.id},direction:{EdenGenerator.hatdirectionvalue(input.value)},guid:{padGuid},port:{port}"
            if input.type == "axis":
                return f"engine:sdl,threshold:0.5,axis:{input.id},guid:{padGuid},port:{port},invert:+"
        return ""

    @staticmethod
    def setAxis(key: str, padGuid: str, padInputs: InputMapping, port: int) -> str:
        inputx = "0"
        inputy = "0"

        if key == "joystick1" and "joystick1left" in padInputs:
            inputx = padInputs["joystick1left"]
        elif key == "joystick2" and "joystick2left" in padInputs:
            inputx = padInputs["joystick2left"]

        if key == "joystick1" and "joystick1up" in padInputs:
                inputy = padInputs["joystick1up"]
        elif key == "joystick2" and "joystick2up" in padInputs:
            inputy = padInputs["joystick2up"]
        return f"engine:sdl,range:1.000000,deadzone:0.100000,invert_y:+,invert_x:+,offset_y:-0.000000,axis_y:{inputy},offset_x:-0.000000,axis_x:{inputx},guid:{padGuid},port:{port}"

    @staticmethod
    def hatdirectionvalue(value: str):
        if int(value) == 1:
            return "up"
        if int(value) == 4:
            return "down"
        if int(value) == 2:
            return "right"
        if int(value) == 8:
            return "left"
        return "unknown"

    @staticmethod
    def getEdenLangFromEnvironment():
        lang = environ['LANG'][:5]
        availableLanguages = { "en_US": 1, "fr_FR": 2, "de_DE": 3, "it_IT": 4, "es_ES": 5, "nl_NL": 8, "pt_PT": 9 }
        if lang in availableLanguages:
            return availableLanguages[lang]
        return availableLanguages["en_US"]

    @staticmethod
    def getEdenRegionFromEnvironment():
        lang = environ['LANG'][:5]
        availableRegions = { "en_US": 1, "ja_JP": 0 }
        if lang in availableRegions:
            return availableRegions[lang]
        return 2 # europe
