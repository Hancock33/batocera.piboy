from __future__ import annotations

import logging
from os import environ
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...batoceraPaths import CACHE, CONFIGS, SAVES, mkdir_if_not_exists
from ...gun import guns_need_crosses
from ...utils import vulkan
from ...utils.configparser import CaseSensitiveConfigParser
from ..Generator import Generator
from . import dolphinControllers, dolphinSYSCONF
from .dolphinPaths import (
    DOLPHIN_BIOS,
    DOLPHIN_CONFIG,
    DOLPHIN_GFX_INI,
    DOLPHIN_INI,
    DOLPHIN_QT_INI,
    DOLPHIN_SAVES,
    DOLPHIN_SYSCONF,
)

if TYPE_CHECKING:
    from ...types import HotkeysContext

_logger = logging.getLogger(__name__)

class DolphinGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        rom_path = Path(rom)

        mkdir_if_not_exists(DOLPHIN_INI.parent)

        # Dir required for saves
        mkdir_if_not_exists(DOLPHIN_SAVES / "StateSaves")

        # Generate the controller config(s)
        dolphinControllers.generateControllerConfig(system, playersControllers, metadata, wheels, rom_path, guns)

        ## [ Qt.ini ] ##
        qtIni = CaseSensitiveConfigParser(interpolation=None)
        if DOLPHIN_QT_INI.exists():
            qtIni.read(DOLPHIN_QT_INI)

        # Sections
        if not qtIni.has_section("Emulation"):
            qtIni.add_section("Emulation")
        if system.isOptSet('state_slot'):
            qtIni.set("Emulation", "StateSlot", str(system.config["state_slot"]))
        else:
            qtIni.set("Emulation", "StateSlot", "1")

        # Save Qt.ini
        with DOLPHIN_QT_INI.open('w') as configfile:
            qtIni.write(configfile)

        ## [ dolphin.ini ] ##
        dolphinSettings = CaseSensitiveConfigParser(interpolation=None)
        if DOLPHIN_INI.exists():
            dolphinSettings.read(DOLPHIN_INI)

        # Sections
        if not dolphinSettings.has_section("General"):
            dolphinSettings.add_section("General")
        if not dolphinSettings.has_section("Core"):
            dolphinSettings.add_section("Core")
        if not dolphinSettings.has_section("DSP"):
            dolphinSettings.add_section("DSP")
        if not dolphinSettings.has_section("Interface"):
            dolphinSettings.add_section("Interface")
        if not dolphinSettings.has_section("Analytics"):
            dolphinSettings.add_section("Analytics")
        if not dolphinSettings.has_section("Display"):
            dolphinSettings.add_section("Display")
        if not dolphinSettings.has_section("GBA"):
            dolphinSettings.add_section("GBA")

        # Define default games path
        if "ISOPaths" not in dolphinSettings["General"]:
            dolphinSettings.set("General", "ISOPath0", "/userdata/roms/wii")
            dolphinSettings.set("General", "ISOPath1", "/userdata/roms/gamecube")
            dolphinSettings.set("General", "ISOPaths", "2")

        # increment savestates
        if system.isOptSet('incrementalsavestates') and not system.getOptBoolean('incrementalsavestates'):
            dolphinSettings.set("General", "AutoIncrementSlot", "False")
        else:
            dolphinSettings.set("General", "AutoIncrementSlot", "True")

        # Don't ask about statistics
        dolphinSettings.set("Analytics", "PermissionAsked", "True")

        # PanicHandlers displaymessages
        dolphinSettings.set("Interface", "UsePanicHandlers", "False")

        # Display message in game (Memory card save and many more...)
        if system.isOptSet("ShowDpMsg") and system.getOptBoolean("ShowDpMsg"):
            dolphinSettings.set("Interface", "OnScreenDisplayMessages", "True")
        else:
            dolphinSettings.set("Interface", "OnScreenDisplayMessages", "False")

        # Don't confirm at stop
        dolphinSettings.set("Interface", "ConfirmStop", "False")

        # fixes exit and gui display
        dolphinSettings.remove_option("Display", "RenderToMain")
        dolphinSettings.remove_option("Display", "Fullscreen")

        # Enable Cheats
        if system.isOptSet("enable_cheats") and system.getOptBoolean("enable_cheats"):
            dolphinSettings.set("Core", "EnableCheats", "True")
        else:
            dolphinSettings.set("Core", "EnableCheats", "False")

        # Speed up disc transfer rate
        if system.isOptSet("enable_fastdisc") and system.getOptBoolean("enable_fastdisc"):
            dolphinSettings.set("Core", "FastDiscSpeed", "True")
        else:
            dolphinSettings.set("Core", "FastDiscSpeed", "False")

        # Dual Core
        if system.isOptSet("dual_core") and system.getOptBoolean("dual_core"):
            dolphinSettings.set("Core", "CPUThread", "True")
        else:
            dolphinSettings.set("Core", "CPUThread", "False")

        # Gpu Sync
        if system.isOptSet("gpu_sync") and system.getOptBoolean("gpu_sync"):
            dolphinSettings.set("Core", "SyncGPU", "True")
        else:
            dolphinSettings.set("Core", "SyncGPU", "False")

        # Gamecube Language
        if system.isOptSet("gamecube_language"):
            dolphinSettings.set("Core", "SelectedLanguage", system.config["gamecube_language"])
        else:
            dolphinSettings.set("Core", "SelectedLanguage", str(getGameCubeLangFromEnvironment()))

        # Enable MMU
        if system.isOptSet("enable_mmu") and system.getOptBoolean("enable_mmu"):
            dolphinSettings.set("Core", "MMU", "True")
        else:
            dolphinSettings.set("Core", "MMU", "False")

        # Backend - Default OpenGL
        if system.isOptSet("gfxbackend") and system.config["gfxbackend"] == "Vulkan":
            dolphinSettings.set("Core", "GFXBackend", "Vulkan")
            # Check Vulkan
            if not vulkan.is_available():
                _logger.debug("Vulkan driver is not available on the system. Using OpenGL instead.")
                dolphinSettings.set("Core", "GFXBackend", "OGL")
        else:
            dolphinSettings.set("Core", "GFXBackend", "OGL")

        # Wiimote scanning
        dolphinSettings.set("Core", "WiimoteContinuousScanning", "True")

        # Force OSD for RetroAchievements messages
        if system.isOptSet('retroachievements') and system.getOptBoolean('retroachievements'):
            dolphinSettings.set("Interface", "OnScreenDisplayMessages", "True")

        # Gamecube ports
        # Create a for loop going 1 through to 4 and iterate through it:
        for i in range(1, 5):
            key = f"dolphin_port_{i}_type"
            if system.isOptSet(key):
                value = system.config[key]
                # Set value to 6 if it is 6a or 6b. This is to differentiate between Standard Controller and GameCube Controller type.
                value = "6" if value in ["6a", "6b"] else value
                # Sub in the appropriate values from es_features, accounting for the 1 integer difference.
                dolphinSettings.set("Core", f"SIDevice{i - 1}", value)
            else:
                # if the pad is a wheel and on gamecube, use it
                if system.name == "gamecube" and system.isOptSet('use_wheels') and system.getOptBoolean('use_wheels') and len(wheels) > 0 and i in playersControllers and playersControllers[i].device_path in wheels:
                    dolphinSettings.set("Core", f"SIDevice{i - 1}", "8")
                else:
                    dolphinSettings.set("Core", f"SIDevice{i - 1}", "6")

        # HiResTextures for guns part 1/2 (see below the part 2)
        if system.isOptSet('use_guns') and system.getOptBoolean('use_guns') and guns and ((system.isOptSet('dolphin-lightgun-hide-crosshair') == False and guns_need_crosses(guns) == False) or system.getOptBoolean('dolphin-lightgun-hide-crosshair') == True):
            dolphinSettings.set("General", "CustomTexturesPath", "/usr/share/DolphinCrosshairsPack")
        else:
            dolphinSettings.remove_option("General", "CustomTexturesPath")

        # Change discs automatically
        dolphinSettings.set("Core", "AutoDiscChange", "True")

        # Skip Menu
        if system.isOptSet("dolphin_SkipIPL") and system.getOptBoolean("dolphin_SkipIPL"):
            # check files exist to avoid crashes
            ipl_regions = ["USA", "EUR", "JAP"]
            if any((DOLPHIN_BIOS / region / "IPL.bin").exists() for region in ipl_regions):
                dolphinSettings.set("Core", "SkipIPL", "False")
            else:
                dolphinSettings.set("Core", "SkipIPL", "True")
        else:
            dolphinSettings.set("Core", "SkipIPL", "True")

        # Set audio backend
        dolphinSettings.set("DSP", "Backend", "Cubeb")

        # Dolby Pro Logic II for surround sound
        # DPL II requires DSPHLE to be disabled
        if system.isOptSet("dplii") and system.getOptBoolean("dplii"):
            dolphinSettings.set("Core", "DPL2Decoder", "True")
            dolphinSettings.set("Core", "DSPHLE", "False")
            dolphinSettings.set("DSP", "EnableJIT", "True")
        else:
            dolphinSettings.set("Core", "DPL2Decoder", "False")
            dolphinSettings.set("Core", "DSPHLE", "True")
            dolphinSettings.set("DSP", "EnableJIT", "False")

        # Save dolphin.ini
        with DOLPHIN_INI.open('w') as configfile:
            dolphinSettings.write(configfile)

        ## [ gfx.ini ] ##
        dolphinGFXSettings = CaseSensitiveConfigParser(interpolation=None)
        dolphinGFXSettings.read(DOLPHIN_GFX_INI)

        # Add Default Sections
        if not dolphinGFXSettings.has_section("Settings"):
            dolphinGFXSettings.add_section("Settings")
        if not dolphinGFXSettings.has_section("Hacks"):
            dolphinGFXSettings.add_section("Hacks")
        if not dolphinGFXSettings.has_section("Enhancements"):
            dolphinGFXSettings.add_section("Enhancements")
        if not dolphinGFXSettings.has_section("Hardware"):
            dolphinGFXSettings.add_section("Hardware")

        # Set Vulkan adapter
        if vulkan.is_available():
            _logger.debug("Vulkan driver is available on the system.")
            if vulkan.has_discrete_gpu():
                _logger.debug("A discrete GPU is available on the system. We will use that for performance")
                discrete_index = vulkan.get_discrete_gpu_index()
                if discrete_index:
                    _logger.debug("Using Discrete GPU Index: %s for Dolphin", discrete_index)
                    dolphinGFXSettings.set("Hardware", "Adapter", discrete_index)
                else:
                    _logger.debug("Couldn't get discrete GPU index")
            else:
                _logger.debug("Discrete GPU is not available on the system. Using default.")

        # Graphics setting Aspect Ratio
        if system.isOptSet('dolphin_aspect_ratio'):
            dolphinGFXSettings.set("Settings", "AspectRatio", system.config["dolphin_aspect_ratio"])
        else:
            # set to zero, which is 'Auto' in Dolphin & Batocera
            dolphinGFXSettings.set("Settings", "AspectRatio", "0")

        # Show fps
        if system.isOptSet("showFPS") and system.getOptBoolean("showFPS"):
            dolphinGFXSettings.set("Settings", "ShowFPS", "True")
        else:
            dolphinGFXSettings.set("Settings", "ShowFPS", "False")

        # HiResTextures
        if system.isOptSet('hires_textures') and system.getOptBoolean('hires_textures'):
            dolphinGFXSettings.set("Settings", "HiresTextures",      "True")
            dolphinGFXSettings.set("Settings", "CacheHiresTextures", "True")
        else:
            dolphinGFXSettings.set("Settings", "HiresTextures",      "False")
            dolphinGFXSettings.set("Settings", "CacheHiresTextures", "False")

        # HiResTextures for guns part 2/2 (see upper part1)
        if system.isOptSet('use_guns') and system.getOptBoolean('use_guns') and guns and (system.isOptSet('dolphin-lightgun-hide-crosshair') == False or system.getOptBoolean('dolphin-lightgun-hide-crosshair') == True):
            # erase what can be set by the option hires_textures
            dolphinGFXSettings.set("Settings", "HiresTextures",      "True")
            dolphinGFXSettings.set("Settings", "CacheHiresTextures", "True")

        # Widescreen Hack
        if system.isOptSet('widescreen_hack') and system.getOptBoolean('widescreen_hack'):
            # Prefer Cheats than Hack
            if system.isOptSet('enable_cheats') and system.getOptBoolean('enable_cheats'):
                dolphinGFXSettings.set("Settings", "wideScreenHack", "False")
            else:
                dolphinGFXSettings.set("Settings", "wideScreenHack", "True")
        else:
            dolphinGFXSettings.set("Settings", "wideScreenHack", "False")

        # Ubershaders (synchronous_ubershader by default)
        if system.isOptSet('ubershaders') and system.config["ubershaders"] != "no_ubershader":
            dolphinGFXSettings.set("Settings", "ShaderCompilationMode", system.config["ubershaders"])
        else:
            dolphinGFXSettings.set("Settings", "ShaderCompilationMode", "0")

        # Shader pre-caching
        if system.isOptSet('wait_for_shaders') and system.getOptBoolean('wait_for_shaders'):
            if system.isOptSet("gfxbackend") and system.config["gfxbackend"] == "Vulkan":
                dolphinGFXSettings.set("Settings", "WaitForShadersBeforeStarting", "True")
            else:
                dolphinGFXSettings.set("Settings", "WaitForShadersBeforeStarting", "False")
        else:
            dolphinGFXSettings.set("Settings", "WaitForShadersBeforeStarting", "False")

        # Various performance hacks - Default Off
        if system.isOptSet('perf_hacks') and system.getOptBoolean('perf_hacks'):
            dolphinGFXSettings.set("Hacks", "BBoxEnable", "False")
            dolphinGFXSettings.set("Hacks", "DeferEFBCopies", "True")
            dolphinGFXSettings.set("Hacks", "EFBEmulateFormatChanges", "False")
            dolphinGFXSettings.set("Hacks", "EFBScaledCopy", "True")
            dolphinGFXSettings.set("Hacks", "EFBToTextureEnable", "True")
            dolphinGFXSettings.set("Hacks", "SkipDuplicateXFBs", "True")
            dolphinGFXSettings.set("Hacks", "XFBToTextureEnable", "True")
            dolphinGFXSettings.set("Enhancements", "ForceFiltering", "True")
            dolphinGFXSettings.set("Enhancements", "ArbitraryMipmapDetection", "True")
            dolphinGFXSettings.set("Enhancements", "DisableCopyFilter", "True")
            dolphinGFXSettings.set("Enhancements", "ForceTrueColor", "True")
        else:
            if dolphinGFXSettings.has_section("Hacks"):
                dolphinGFXSettings.remove_option("Hacks", "BBoxEnable")
                dolphinGFXSettings.remove_option("Hacks", "DeferEFBCopies")
                dolphinGFXSettings.remove_option("Hacks", "EFBEmulateFormatChanges")
                dolphinGFXSettings.remove_option("Hacks", "EFBScaledCopy")
                dolphinGFXSettings.remove_option("Hacks", "EFBToTextureEnable")
                dolphinGFXSettings.remove_option("Hacks", "SkipDuplicateXFBs")
                dolphinGFXSettings.remove_option("Hacks", "XFBToTextureEnable")
            if dolphinGFXSettings.has_section("Enhancements"):
                dolphinGFXSettings.remove_option("Enhancements", "ForceFiltering")
                dolphinGFXSettings.remove_option("Enhancements", "ArbitraryMipmapDetection")
                dolphinGFXSettings.remove_option("Enhancements", "DisableCopyFilter")
                dolphinGFXSettings.remove_option("Enhancements", "ForceTrueColor")

        if system.isOptSet('vbi_hack') and system.getOptBoolean("vbi_hack"):
            dolphinGFXSettings.set("Hacks", "VISkip", "True")
        else:
            dolphinGFXSettings.set("Hacks", "VISkip", "False")

        # Internal resolution settings
        if system.isOptSet('internal_resolution'):
            dolphinGFXSettings.set("Settings", "InternalResolution", system.config["internal_resolution"])
        else:
            dolphinGFXSettings.set("Settings", "InternalResolution", "1")

        # VSync
        if system.isOptSet('vsync') and system.getOptBoolean("vsync") == False:
            dolphinGFXSettings.set("Hardware", "VSync", "False")
        else:
            dolphinGFXSettings.set("Hardware", "VSync", "True")

        # Anisotropic filtering
        if system.isOptSet('anisotropic_filtering'):
            dolphinGFXSettings.set("Enhancements", "MaxAnisotropy", system.config["anisotropic_filtering"])
        else:
            dolphinGFXSettings.set("Enhancements", "MaxAnisotropy", "0")

        # Anti aliasing
        if system.isOptSet('antialiasing'):
            dolphinGFXSettings.set("Settings", "MSAA", system.config["antialiasing"])
        else:
            dolphinGFXSettings.set("Settings", "MSAA", "0")

        # Anti aliasing mode
        if system.isOptSet('use_ssaa') and system.getOptBoolean('use_ssaa'):
            dolphinGFXSettings.set("Settings", "SSAA", "True")
        else:
            dolphinGFXSettings.set("Settings", "SSAA", "False")

        # Manual texture sampling
        # Setting on = speed hack off. Setting off = speed hack on
        if system.isOptSet('manual_texture_sampling') and system.getOptBoolean('manual_texture_sampling'):
            dolphinGFXSettings.set("Hacks", "FastTextureSampling", "False")
        else:
            dolphinGFXSettings.set("Hacks", "FastTextureSampling", "True")

        # Save gfx.ini
        with DOLPHIN_GFX_INI.open('w') as configfile:
            dolphinGFXSettings.write(configfile)

        ## Hotkeys.ini - overwrite to avoid issues
        hotkeyConfig = CaseSensitiveConfigParser(interpolation=None)
        # [Hotkeys]
        hotkeyConfig.add_section('Hotkeys')
        # General - use virtual for now
        hotkeyConfig.set('Hotkeys', 'Device', 'XInput2/0/Virtual core pointer')
        hotkeyConfig.set('Hotkeys', 'General/Open', '@(Ctrl+O)')
        hotkeyConfig.set('Hotkeys', 'General/Toggle Pause', 'F10')
        hotkeyConfig.set('Hotkeys', 'General/Stop', 'Escape')
        hotkeyConfig.set('Hotkeys', 'General/Toggle Fullscreen', '@(Alt+Return)')
        hotkeyConfig.set('Hotkeys', 'General/Take Screenshot', 'F9')
        hotkeyConfig.set('Hotkeys', 'General/Exit', '@(Shift+F11)')
        # Emulation Speed
        hotkeyConfig.set('Hotkeys', 'Emulation Speed/Disable Emulation Speed Limit', 'Tab')
        # Stepping
        hotkeyConfig.set('Hotkeys', 'Stepping/Step Into', 'F11')
        hotkeyConfig.set('Hotkeys', 'Stepping/Step Over', '@(Shift+F10)')
        hotkeyConfig.set('Hotkeys', 'Stepping/Step Out', '@(Shift+F11)')
        # Breakpoint
        hotkeyConfig.set('Hotkeys', 'Breakpoint/Toggle Breakpoint', '@(Shift+F9)')
        # Wii
        hotkeyConfig.set('Hotkeys', 'Wii/Connect Wii Remote 1', '@(Alt+F5)')
        hotkeyConfig.set('Hotkeys', 'Wii/Connect Wii Remote 2', '@(Alt+F6)')
        hotkeyConfig.set('Hotkeys', 'Wii/Connect Wii Remote 3', '@(Alt+F7)')
        hotkeyConfig.set('Hotkeys', 'Wii/Connect Wii Remote 4', '@(Alt+F8)')
        hotkeyConfig.set('Hotkeys', 'Wii/Connect Balance Board', '@(Alt+F9)')
        # Select
        hotkeyConfig.set('Hotkeys', 'Other State Hotkeys/Increase Selected State Slot', '@(Shift+F1)')
        hotkeyConfig.set('Hotkeys', 'Other State Hotkeys/Decrease Selected State Slot', '@(Shift+F2)')
        # Load
        hotkeyConfig.set('Hotkeys', 'Load State/Load from Selected Slot', 'F8')
        # Save State
        hotkeyConfig.set('Hotkeys', 'Save State/Save to Selected Slot', 'F5')
        # Other State Hotkeys
        hotkeyConfig.set('Hotkeys', 'Other State Hotkeys/Undo Load State', '@(Shift+F12)')
        # GBA Core
        hotkeyConfig.set('Hotkeys', 'GBA Core/Load ROM', '@(`Ctrl`+`Shift`+`O`)')
        hotkeyConfig.set('Hotkeys', 'GBA Core/Unload ROM', '@(`Ctrl`+`Shift`+`W`)')
        hotkeyConfig.set('Hotkeys', 'GBA Core/Reset', '@(`Ctrl`+`Shift`+`R`)')
        # GBA Volume
        hotkeyConfig.set('Hotkeys', 'GBA Volume/Volume Down', '`KP_Subtract`')
        hotkeyConfig.set('Hotkeys', 'GBA Volume/Volume Up', '`KP_Add`')
        hotkeyConfig.set('Hotkeys', 'GBA Volume/Volume Toggle Mute', '`M`')
        # GBA Window Size
        hotkeyConfig.set('Hotkeys', 'GBA Window Size/1x', '`KP_1`')
        hotkeyConfig.set('Hotkeys', 'GBA Window Size/2x', '`KP_2`')
        hotkeyConfig.set('Hotkeys', 'GBA Window Size/3x', '`KP_3`')
        hotkeyConfig.set('Hotkeys', 'GBA Window Size/4x', '`KP_4`')
        # Skylanders Portal
        hotkeyConfig.set('Hotkeys', 'USB Emulation Devices/Show Skylanders Portal', '@(Ctrl+P)')
        hotkeyConfig.set('Hotkeys', 'USB Emulation Devices/Show Infinity Base', '@(Ctrl+I)')
        #
        # Write the configuration to the file
        with (DOLPHIN_CONFIG / 'Hotkeys.ini').open('w') as configfile:
            hotkeyConfig.write(configfile)

        ## Retroachievements
        RacConfig = CaseSensitiveConfigParser(interpolation=None)
        # [Achievements]
        RacConfig.add_section('Achievements')
        if system.isOptSet('retroachievements') and system.getOptBoolean('retroachievements'):
            RacConfig.set('Achievements', 'Enabled', 'True')
            RacConfig.set('Achievements', 'AchievementsEnabled', 'True')
            username  = system.config.get('retroachievements.username', '')
            token     = system.config.get('retroachievements.token', '')
            hardcore  = system.config.get('retroachievements.hardcore', 'False')
            presence  = system.config.get('retroachievements.richpresence', 'False')
            leaderbd  = system.config.get('retroachievements.leaderboard', 'False')
            progress  = system.config.get('retroachievements.challenge_indicators', 'False')
            encore    = system.config.get('retroachievements.encore', 'False')
            verbose   = system.config.get('retroachievements.verbose', 'False')
            RacConfig.set('Achievements', 'Username', username)
            RacConfig.set('Achievements', 'ApiToken', token)
            RacConfig.set('Achievements', 'HardcoreEnabled', hardcore)
            RacConfig.set('Achievements', 'BadgesEnabled', verbose)
            RacConfig.set('Achievements', 'EncoreEnabled', encore)
            RacConfig.set('Achievements', 'ProgressEnabled', progress)
            RacConfig.set('Achievements', 'LeaderboardsEnabled', leaderbd)
            RacConfig.set('Achievements', 'RichPresenceEnabled', presence)
        else:
            RacConfig.set('Achievements', 'Enabled', 'False')
            RacConfig.set('Achievements', 'AchievementsEnabled', 'False')
        # Write the configuration to the file
        with (DOLPHIN_CONFIG / 'RetroAchievements.ini').open('w') as rac_configfile:
            RacConfig.write(rac_configfile)

        # Update SYSCONF
        try:
            dolphinSYSCONF.update(system.config, DOLPHIN_SYSCONF, gameResolution)
        except Exception:
            pass # don't fail in case of SYSCONF update

        # Check what version we've got
        if Path("/usr/bin/dolphin-emu-nogui").is_file():
            commandArray = ["dolphin-emu-nogui", "-e", rom]
        else:
            # use the -b 'batch' option for nicer exit
            commandArray = ["dolphin-emu", "-b", "-e", rom]

        # state_slot option
        if system.isOptSet('state_filename'):
            commandArray.extend(["--save_state", system.config['state_filename']])

        return Command.Command(
            array=commandArray,
            env={
                "XDG_CONFIG_HOME": CONFIGS,
                "XDG_DATA_HOME": SAVES,
                "XDG_CACHE_HOME": CACHE
            }
        )

    def getInGameRatio(self, config, gameResolution, rom):

        dolphinGFXSettings = CaseSensitiveConfigParser(interpolation=None)
        dolphinGFXSettings.read(DOLPHIN_GFX_INI)

        dolphin_aspect_ratio = dolphinGFXSettings.get("Settings", "AspectRatio")
        # What if we're playing a GameCube game with the widescreen patch or not?
        if 'widescreen_hack' in config and config["widescreen_hack"] == "1":
            wii_tv_mode = 1
        else:
            wii_tv_mode = 0

        try:
            wii_tv_mode = dolphinSYSCONF.getRatioFromConfig(config, gameResolution)
        except:
            pass

        # Auto
        if dolphin_aspect_ratio == "0":
            if wii_tv_mode == 1:
                return 16/9
            return 4/3

        # Forced 16:9
        if dolphin_aspect_ratio == "1":
            return 16/9

        # Forced 4:3
        if dolphin_aspect_ratio == "2":
            return 4/3

        # Stretched (thus depends on physical screen geometry)
        if dolphin_aspect_ratio == "3":
            return gameResolution["width"] / gameResolution["height"]

        return 4/3

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "dolphin",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"],
                      "previous_slot": [ "KEY_LEFTSHIFT", "KEY_F2" ], "next_slot": [ "KEY_LEFTSHIFT", "KEY_F1" ], "save_state": "KEY_F5", "restore_state": "KEY_F8" }
        }

# Get the language from the environment if user didn't set it in ES.
# Seem to be only for the gamecube. However, while this is not in a gamecube section
# It may be used for something else, so set it anyway
def getGameCubeLangFromEnvironment():
    lang = environ['LANG'][:5]
    availableLanguages = { "en_US": 0, "de_DE": 1, "fr_FR": 2, "es_ES": 3, "it_IT": 4, "nl_NL": 5 }
    if lang in availableLanguages:
        return availableLanguages[lang]
    else:
        return availableLanguages["en_US"]
