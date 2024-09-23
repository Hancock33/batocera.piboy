import shutil
import os.path
from os import environ
import configparser
import subprocess

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator
from . import dolphinTriforceControllers


class DolphinTriforceGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        if not os.path.exists(os.path.dirname(batoceraFiles.dolphinTriforceIni)):
            os.makedirs(os.path.dirname(batoceraFiles.dolphinTriforceIni))

        # Dir required for saves
        if not os.path.exists(batoceraFiles.dolphinTriforceData + "/StateSaves"):
            os.makedirs(batoceraFiles.dolphinTriforceData + "/StateSaves")

        dolphinTriforceGameConfig.generateGameConfig()
        ## dolphin.ini ##

        dolphinTriforceSettings = configparser.ConfigParser(interpolation=None)
        # To prevent ConfigParser from converting to lower case
        dolphinTriforceSettings.optionxform = str
        if os.path.exists(batoceraFiles.dolphinTriforceIni):
            dolphinTriforceSettings.read(batoceraFiles.dolphinTriforceIni)

        # Sections
        if not dolphinTriforceSettings.has_section("Analytics"):
            dolphinTriforceSettings.add_section("Analytics")
        if not dolphinTriforceSettings.has_section("Display"):
            dolphinTriforceSettings.add_section("Display")
        if not dolphinTriforceSettings.has_section("General"):
            dolphinTriforceSettings.add_section("General")
        if not dolphinTriforceSettings.has_section("Interface"):
            dolphinTriforceSettings.add_section("Interface")
        if not dolphinTriforceSettings.has_section("Core"):
            dolphinTriforceSettings.add_section("Core")

        # only 1 window (fixes exit and gui display)
        dolphinTriforceSettings.remove_option("Display", "RenderToMain")
        dolphinTriforceSettings.remove_option("Display", "Fullscreen")
        dolphinTriforceSettings.remove_option("Display", "RenderWindowAutoSize")

        # Define default games path
        if "ISOPaths" not in dolphinTriforceSettings["General"]:
            dolphinTriforceSettings.set("General", "ISOPath0", "/userdata/roms/triforce")
            dolphinTriforceSettings.set("General", "ISOPaths", "1")
        if "GCMPathes" not in dolphinTriforceSettings["General"]:
            dolphinTriforceSettings.set("General", "GCMPath0", "/userdata/roms/triforce")
            dolphinTriforceSettings.set("General", "GCMPathes", "1")

        # Save file location
        if "MemcardAPath" not in dolphinTriforceSettings["Core"]:
            dolphinTriforceSettings.set("Core", "MemcardAPath", "/userdata/saves/dolphin-triforce/GC/MemoryCardA.USA.raw")
            dolphinTriforceSettings.set("Core", "MemcardBPath", "/userdata/saves/dolphin-triforce/GC/MemoryCardB.USA.raw")

        # Draw or not FPS
        if system.isOptSet("showFPS") and system.getOptBoolean("showFPS"):
            dolphinTriforceSettings.set("General", "ShowLag",        "True")
            dolphinTriforceSettings.set("General", "ShowFrameCount", "True")
        else:
            dolphinTriforceSettings.set("General", "ShowLag",        "False")
            dolphinTriforceSettings.set("General", "ShowFrameCount", "False")

        # Don't ask about statistics
        dolphinTriforceSettings.set("Analytics", "PermissionAsked", "True")

        # PanicHandlers displaymessages
        dolphinTriforceSettings.set("Interface", "UsePanicHandlers",        "False")

        # Disable OSD Messages
        if system.isOptSet("disable_osd_messages") and system.getOptBoolean("disable_osd_messages"):
            dolphinTriforceSettings.set("Interface", "OnScreenDisplayMessages", "False")
        else:
            dolphinTriforceSettings.set("Interface", "OnScreenDisplayMessages", "True")

        # Don't confirm at stop
        dolphinTriforceSettings.set("Interface", "ConfirmStop", "False")

        # Enable Cheats
        dolphinTriforceSettings.set("Core", "EnableCheats", "True")

        # Dual Core
        dolphinTriforceSettings.set("Core", "CPUThread", "True")
        dolphinTriforceSettings.set("Core", "FPRF", "True")

        # Gpu Sync
        if system.isOptSet("gpu_sync") and system.getOptBoolean("gpu_sync"):
            dolphinTriforceSettings.set("Core", "SyncGPU", "True")
        else:
            dolphinTriforceSettings.set("Core", "SyncGPU", "False")

        # Language
        dolphinTriforceSettings.set("Core", "SelectedLanguage", str(getGameCubeLangFromEnvironment())) # Wii
        dolphinTriforceSettings.set("Core", "GameCubeLanguage", str(getGameCubeLangFromEnvironment())) # GC

        # Enable MMU
        if system.isOptSet("enable_mmu") and system.getOptBoolean("enable_mmu"):
            dolphinTriforceSettings.set("Core", "MMU", "True")
        else:
            dolphinTriforceSettings.set("Core", "MMU", "False")

        # Backend - Default OpenGL
        if system.isOptSet("gfxbackend") and system.config["gfxbackend"] == "Vulkan":
            dolphinTriforceSettings.set("Core", "GFXBackend", "Vulkan")
            # Check Vulkan
            try:
                have_vulkan = subprocess.check_output(["/usr/bin/batocera-vulkan", "hasVulkan"], text=True).strip()
                if have_vulkan != "true":
                    eslog.debug("Vulkan driver is not available on the system. Using OpenGL instead.")
                    dolphinTriforceSettings.set("Core", "GFXBackend", "OGL")
            except subprocess.CalledProcessError:
                eslog.debug("Error checking for discrete GPU.")
        else:
            dolphinTriforceSettings.set("Core", "GFXBackend", "OGL")

        # Serial Port 1 to AM-Baseband
        dolphinTriforceSettings.set("Core", "SerialPort1", "6")
        dolphinTriforceSettings.set("Core", "SIDevice0", "11")

        # Save dolphin.ini
        with open(batoceraFiles.dolphinTriforceIni, 'w') as configfile:
            dolphinTriforceSettings.write(configfile)

        ## gfx.ini ##

        dolphinTriforceGFXSettings = configparser.ConfigParser(interpolation=None)
        # To prevent ConfigParser from converting to lower case
        dolphinTriforceGFXSettings.optionxform = str
        dolphinTriforceGFXSettings.read(batoceraFiles.dolphinTriforceGfxIni)

        # Add Default Sections
        if not dolphinTriforceGFXSettings.has_section("Settings"):
            dolphinTriforceGFXSettings.add_section("Settings")
        if not dolphinTriforceGFXSettings.has_section("Hacks"):
            dolphinTriforceGFXSettings.add_section("Hacks")
        if not dolphinTriforceGFXSettings.has_section("Enhancements"):
            dolphinTriforceGFXSettings.add_section("Enhancements")
        if not dolphinTriforceGFXSettings.has_section("Hardware"):
            dolphinTriforceGFXSettings.add_section("Hardware")

        # Graphics setting Aspect Ratio
        if system.isOptSet('dolphin_aspect_ratio'):
            dolphinTriforceGFXSettings.set("Settings", "AspectRatio", system.config["dolphin_aspect_ratio"])
        else:
            # set to two, which is '4:3' in Dolphin and stops auto switching ingame
            dolphinTriforceGFXSettings.set("Settings", "AspectRatio", "2")

        # Show fps
        if system.isOptSet("showFPS") and system.getOptBoolean("showFPS"):
            dolphinTriforceGFXSettings.set("Settings", "ShowFPS", "True")
        else:
            dolphinTriforceGFXSettings.set("Settings", "ShowFPS", "False")

        # HiResTextures
        if system.isOptSet('hires_textures') and system.getOptBoolean('hires_textures'):
            dolphinTriforceGFXSettings.set("Settings", "HiresTextures",      "True")
            dolphinTriforceGFXSettings.set("Settings", "CacheHiresTextures", "True")
        else:
            dolphinTriforceGFXSettings.set("Settings", "HiresTextures",      "False")
            dolphinTriforceGFXSettings.set("Settings", "CacheHiresTextures", "False")

        # Widescreen Hack
        if system.isOptSet('widescreen_hack') and system.getOptBoolean('widescreen_hack'):
            # Prefer Cheats than Hack
            if system.isOptSet('enable_cheats') and system.getOptBoolean('enable_cheats'):
                dolphinTriforceGFXSettings.set("Settings", "wideScreenHack", "False")
            else:
                dolphinTriforceGFXSettings.set("Settings", "wideScreenHack", "True")
        else:
            dolphinTriforceGFXSettings.set("Settings", "wideScreenHack", "False")

        # Various performance hacks - Default Off
        if system.isOptSet('perf_hacks') and system.getOptBoolean('perf_hacks'):
            dolphinTriforceGFXSettings.set("Hacks", "BBoxEnable", "False")
            dolphinTriforceGFXSettings.set("Hacks", "DeferEFBCopies", "True")
            dolphinTriforceGFXSettings.set("Hacks", "EFBEmulateFormatChanges", "False")
            dolphinTriforceGFXSettings.set("Hacks", "EFBScaledCopy", "True")
            dolphinTriforceGFXSettings.set("Hacks", "EFBToTextureEnable", "True")
            dolphinTriforceGFXSettings.set("Hacks", "SkipDuplicateXFBs", "True")
            dolphinTriforceGFXSettings.set("Hacks", "XFBToTextureEnable", "True")
            dolphinTriforceGFXSettings.set("Enhancements", "ForceFiltering", "True")
            dolphinTriforceGFXSettings.set("Enhancements", "ArbitraryMipmapDetection", "True")
            dolphinTriforceGFXSettings.set("Enhancements", "DisableCopyFilter", "True")
            dolphinTriforceGFXSettings.set("Enhancements", "ForceTrueColor", "True")
        else:
            if dolphinTriforceGFXSettings.has_section("Hacks"):
                dolphinTriforceGFXSettings.remove_option("Hacks", "BBoxEnable")
                dolphinTriforceGFXSettings.remove_option("Hacks", "DeferEFBCopies")
                dolphinTriforceGFXSettings.remove_option("Hacks", "EFBEmulateFormatChanges")
                dolphinTriforceGFXSettings.remove_option("Hacks", "EFBScaledCopy")
                dolphinTriforceGFXSettings.remove_option("Hacks", "EFBToTextureEnable")
                dolphinTriforceGFXSettings.remove_option("Hacks", "SkipDuplicateXFBs")
                dolphinTriforceGFXSettings.remove_option("Hacks", "XFBToTextureEnable")
            if dolphinTriforceGFXSettings.has_section("Enhancements"):
                dolphinTriforceGFXSettings.remove_option("Enhancements", "ForceFiltering")
                dolphinTriforceGFXSettings.remove_option("Enhancements", "ArbitraryMipmapDetection")
                dolphinTriforceGFXSettings.remove_option("Enhancements", "DisableCopyFilter")
                dolphinTriforceGFXSettings.remove_option("Enhancements", "ForceTrueColor")

        # Internal resolution settings
        if system.isOptSet('internal_resolution'):
            dolphinTriforceGFXSettings.set("Settings", "EFBScale", system.config["internal_resolution"])
        else:
            dolphinTriforceGFXSettings.set("Settings", "EFBScale", "2")

        # VSync
        if system.isOptSet('vsync'):
            dolphinTriforceGFXSettings.set("Hardware", "VSync", str(system.getOptBoolean('vsync')))
        else:
            dolphinTriforceGFXSettings.set("Hardware", "VSync", "True")

        # Anisotropic filtering
        if system.isOptSet('anisotropic_filtering'):
            dolphinTriforceGFXSettings.set("Enhancements", "MaxAnisotropy", system.config["anisotropic_filtering"])
        else:
            dolphinTriforceGFXSettings.set("Enhancements", "MaxAnisotropy", "0")

        # Anti aliasing
        if system.isOptSet('antialiasing'):
            dolphinTriforceGFXSettings.set("Settings", "MSAA", system.config["antialiasing"])
        else:
            dolphinTriforceGFXSettings.set("Settings", "MSAA", "0")

        # Save gfx.ini
        with open(batoceraFiles.dolphinTriforceGfxIni, 'w') as configfile:
            dolphinTriforceGFXSettings.write(configfile)

        ## Hotkeys.ini - overwrite to avoid issues
        hotkeyConfig = configparser.ConfigParser(interpolation=None)
        # To prevent ConfigParser from converting to lower case
        hotkeyConfig.optionxform = str
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
        hotkeyConfig.set('Hotkeys', 'Select State/Select State Slot 1', '@(Shift+F1)')
        hotkeyConfig.set('Hotkeys', 'Select State/Select State Slot 2', '@(Shift+F2)')
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
        hotkey_path = '/userdata/system/configs/dolphin-triforce/Config/Hotkeys.ini'
        with open(hotkey_path, 'w') as configfile:
            hotkeyConfig.write(configfile)

        ## logger settings ##

        dolphinTriforceLogSettings = configparser.ConfigParser(interpolation=None)
        # To prevent ConfigParser from converting to lower case
        dolphinTriforceLogSettings.optionxform = str
        dolphinTriforceLogSettings.read(batoceraFiles.dolphinTriforceLoggerIni)

        # Sections
        if not dolphinTriforceLogSettings.has_section("Logs"):
            dolphinTriforceLogSettings.add_section("Logs")

        # Prevent the constant log spam.
        dolphinTriforceLogSettings.set("Logs", "DVD", "False")

        # Save Logger.ini
        with open(batoceraFiles.dolphinTriforceLoggerIni, 'w') as configfile:
            dolphinTriforceLogSettings.write(configfile)

        commandArray = ["dolphin-triforce", "-b", "-u", "/userdata/system/configs/dolphin-triforce", "-e", rom]

        # No environment variables work for now, paths are coded in above.
        return Command.Command(array=commandArray, env={"XDG_CONFIG_HOME":batoceraFiles.CONF, "XDG_DATA_HOME":batoceraFiles.SAVES})

    def getInGameRatio(self, config, gameResolution, rom):
        if 'dolphin_aspect_ratio' in config:
            if config['dolphin_aspect_ratio'] == "1":
                return 16/9
            elif config['dolphin_aspect_ratio'] == "3" and (gameResolution["width"] / float(gameResolution["height"]) > ((16.0 / 9.0) - 0.1)):
                return 16/9
        return 4/3

# Seem to be only for the gamecube. However, while this is not in a gamecube section
# It may be used for something else, so set it anyway
def getGameCubeLangFromEnvironment():
    lang = environ['LANG'][:5]
    availableLanguages = { "en_US": 0, "de_DE": 1, "fr_FR": 2, "es_ES": 3, "it_IT": 4, "nl_NL": 5 }
    if lang in availableLanguages:
        return availableLanguages[lang]
    else:
        return availableLanguages["en_US"]
