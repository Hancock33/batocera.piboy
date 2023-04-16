#!/usr/bin/env python

from generators.Generator import Generator
import Command
import os
import batoceraFiles
import configparser
from os import environ

class YuzuGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):

        if not os.path.exists(batoceraFiles.CONF+"/yuzu"):
            os.makedirs(batoceraFiles.CONF+"/yuzu")

        YuzuGenerator.writeYuzuConfig(batoceraFiles.CONF + "/yuzu/qt-config.ini", system, playersControllers)

        commandArray = ["/usr/bin/yuzu", "-f", "-g", rom ]
        return Command.Command(array=commandArray, env={
            "XDG_CONFIG_HOME":batoceraFiles.CONF, \
            "XDG_DATA_HOME":batoceraFiles.SAVES + "/switch", \
            "XDG_CACHE_HOME":batoceraFiles.CACHE, \
            "QT_QPA_PLATFORM":"xcb"})

    def writeYuzuConfig(yuzuConfigFile, system, playersControllers):
        # ini file
        yuzuConfig = configparser.RawConfigParser()
        yuzuConfig.optionxform=str
        if os.path.exists(yuzuConfigFile):
            yuzuConfig.read(yuzuConfigFile)

        #### Audio section ####
        if not yuzuConfig.has_section("Audio"):
            yuzuConfig.add_section("Audio")

        yuzuConfig.set("Audio", "output_engine", "cubeb")

        #### UI section ####
        if not yuzuConfig.has_section("UI"):
            yuzuConfig.add_section("UI")
        yuzuConfig.set("UI", "fullscreen", "true")
        yuzuConfig.set("UI", "fullscreen\\default", "false")
        yuzuConfig.set("UI", "confirmClose", "false")
        yuzuConfig.set("UI", "confirmClose\\default", "false")
        yuzuConfig.set("UI", "firstStart", "false")
        yuzuConfig.set("UI", "firstStart\\default", "false")
        yuzuConfig.set("UI", "displayTitleBars", "false")
        yuzuConfig.set("UI", "displayTitleBars\\default", "false")
        yuzuConfig.set("UI", "enable_discord_presence", "false")
        yuzuConfig.set("UI", "enable_discord_presence\\default", "false")
        yuzuConfig.set("UI", "calloutFlags", "1")
        yuzuConfig.set("UI", "calloutFlags\\default", "false")

        # Single Window Mode
        if system.isOptSet('yuzu_single_window'):
            yuzuConfig.set("UI", "singleWindowMode", system.config["yuzu_single_window"])
        else:
            yuzuConfig.set("UI", "singleWindowMode", "true")
        yuzuConfig.set("UI", "singleWindowMode\\default", "false")

        yuzuConfig.set("UI", "hideInactiveMouse", "true")
        yuzuConfig.set("UI", "hideInactiveMouse\\default", "false")

        # Roms path (need for load update/dlc)
        yuzuConfig.set("UI", "Paths\\gamedirs\\1\\deep_scan", "true")
        yuzuConfig.set("UI", "Paths\\gamedirs\\1\\deep_scan\\default", "false")
        yuzuConfig.set("UI", "Paths\\gamedirs\\1\\expanded", "true")
        yuzuConfig.set("UI", "Paths\\gamedirs\\1\\expanded\\default", "false")
        yuzuConfig.set("UI", "Paths\\gamedirs\\1\\path", "/userdata/roms/switch")
        yuzuConfig.set("UI", "Paths\\gamedirs\\size", "1")

        yuzuConfig.set("UI", "Screenshots\\enable_screenshot_save_as", "true")
        yuzuConfig.set("UI", "Screenshots\\enable_screenshot_save_as\\default", "false")
        yuzuConfig.set("UI", "Screenshots\\screenshot_path", "/userdata/screenshots")
        yuzuConfig.set("UI", "Screenshots\\screenshot_path\\default", "false")

        #### Data Storage section ####
        if not yuzuConfig.has_section("Data%20Storage"):
            yuzuConfig.add_section("Data%20Storage")
        yuzuConfig.set("Data%20Storage", "dump_directory", "/userdata/system/configs/yuzu/dump")
        yuzuConfig.set("Data%20Storage", "dump_directory\\default", "false")

        yuzuConfig.set("Data%20Storage", "load_directory", "/userdata/system/configs/yuzu/load")
        yuzuConfig.set("Data%20Storage", "load_directory\\default", "false")

        yuzuConfig.set("Data%20Storage", "nand_directory", "/userdata/system/configs/yuzu/nand")
        yuzuConfig.set("Data%20Storage", "nand_directory\\default", "false")

        yuzuConfig.set("Data%20Storage", "sdmc_directory", "/userdata/system/configs/yuzu/sdmc")
        yuzuConfig.set("Data%20Storage", "sdmc_directory\\default", "false")

        yuzuConfig.set("Data%20Storage", "tas_directory", "/userdata/system/configs/yuzu/tas")
        yuzuConfig.set("Data%20Storage", "tas_directory\\default", "false")

        yuzuConfig.set("Data%20Storage", "use_virtual_sd", "true")
        yuzuConfig.set("Data%20Storage", "use_virtual_sd\\default", "false")

        #### Core section ####
        if not yuzuConfig.has_section("Core"):
            yuzuConfig.add_section("Core")

        # Multicore
        if system.isOptSet('yuzu_multicore'):
            yuzuConfig.set("Core", "use_multi_core", system.config["yuzu_multicore"])
        else:
            yuzuConfig.set("Core", "use_multi_core", "true")
        yuzuConfig.set("Core", "use_multi_core\\default", "false")

        #### Renderer section ####
        if not yuzuConfig.has_section("Renderer"):
            yuzuConfig.add_section("Renderer")

        # Aspect ratio
        if system.isOptSet('yuzu_ratio'):
            yuzuConfig.set("Renderer", "aspect_ratio", system.config["yuzu_ratio"])
        else:
            yuzuConfig.set("Renderer", "aspect_ratio", "0")
        yuzuConfig.set("Renderer", "aspect_ratio\\default", "false")

        # Graphical backend
        if system.isOptSet('yuzu_backend'):
            yuzuConfig.set("Renderer", "backend", system.config["yuzu_backend"])
        else:
            yuzuConfig.set("Renderer", "backend", "0")
        yuzuConfig.set("Renderer", "backend\\default", "false")

        # Async Shader compilation
        if system.isOptSet('yuzu_async_shaders'):
            yuzuConfig.set("Renderer", "use_asynchronous_shaders", system.config["yuzu_async_shaders"])
        else:
            yuzuConfig.set("Renderer", "use_asynchronous_shaders", "true")
        yuzuConfig.set("Renderer", "use_asynchronous_shaders\\default", "false")

        # Assembly shaders
        if system.isOptSet('yuzu_shaderbackend'):
            yuzuConfig.set("Renderer", "shader_backend", system.config["yuzu_shaderbackend"])
        else:
            yuzuConfig.set("Renderer", "shader_backend", "0")
        yuzuConfig.set("Renderer", "shader_backend\\default", "false")

        # Async Gpu Emulation
        if system.isOptSet('yuzu_async_gpu'):
            yuzuConfig.set("Renderer", "use_asynchronous_gpu_emulation", system.config["yuzu_async_gpu"])
        else:
            yuzuConfig.set("Renderer", "use_asynchronous_gpu_emulation", "true")
        yuzuConfig.set("Renderer", "use_asynchronous_gpu_emulation\\default", "false")

        # NVDEC Emulation
        if system.isOptSet('yuzu_nvdec_emu'):
            yuzuConfig.set("Renderer", "nvdec_emulation", system.config["yuzu_nvdec_emu"])
        else:
            yuzuConfig.set("Renderer", "nvdec_emulation", "2")
        yuzuConfig.set("Renderer", "nvdec_emulation\\default", "false")

        # Gpu Accuracy
        if system.isOptSet('yuzu_gpuaccuracy'):
            yuzuConfig.set("Renderer", "gpu_accuracy", system.config["yuzu_gpuaccuracy"])
        else:
            yuzuConfig.set("Renderer", "gpu_accuracy", "0")
        yuzuConfig.set("Renderer", "gpu_accuracy\\default", "false")

        # Vsync
        if system.isOptSet('yuzu_vsync'):
            yuzuConfig.set("Renderer", "use_vsync", system.config["yuzu_vsync"])
        else:
            yuzuConfig.set("Renderer", "use_vsync", "false")
        yuzuConfig.set("Renderer", "use_vsync\\default", "false")

        # Gpu cache garbage collection
        if system.isOptSet('yuzu_gpu_cache_gc'):
            yuzuConfig.set("Renderer", "use_caches_gc", system.config["yuzu_gpu_cache_gc"])
        else:
            yuzuConfig.set("Renderer", "use_caches_gc", "false")
        yuzuConfig.set("Renderer", "use_caches_gc\\default", "false")

        # Max anisotropy
        if system.isOptSet('yuzu_anisotropy'):
            yuzuConfig.set("Renderer", "max_anisotropy", system.config["yuzu_anisotropy"])
        else:
            yuzuConfig.set("Renderer", "max_anisotropy", "0")
        yuzuConfig.set("Renderer", "max_anisotropy\\default", "false")

        # Resolution scaler
        if system.isOptSet('yuzu_scale'):
            yuzuConfig.set("Renderer", "resolution_setup", system.config["yuzu_scale"])
        else:
            yuzuConfig.set("Renderer", "resolution_setup", "2")
        yuzuConfig.set("Renderer", "resolution_setup\\default", "false")

        # Scaling filter
        if system.isOptSet('yuzu_scale_filter'):
            yuzuConfig.set("Renderer", "scaling_filter", system.config["yuzu_scale_filter"])
        else:
            yuzuConfig.set("Renderer", "scaling_filter", "1")
        yuzuConfig.set("Renderer", "scaling_filter\\default", "false")

        # Anti aliasing method
        if system.isOptSet('yuzu_aliasing_method'):
            yuzuConfig.set("Renderer", "anti_aliasing", system.config["yuzu_aliasing_method"])
        else:
            yuzuConfig.set("Renderer", "anti_aliasing", "0")
        yuzuConfig.set("Renderer", "anti_aliasing\\default", "false")

        #### Cpu Section ####
        if not yuzuConfig.has_section("Cpu"):
            yuzuConfig.add_section("Cpu")

        # Cpu Accuracy
        if system.isOptSet('yuzu_cpuaccuracy'):
            yuzuConfig.set("Cpu", "cpu_accuracy", system.config["yuzu_cpuaccuracy"])
        else:
            yuzuConfig.set("Cpu", "cpu_accuracy", "0")
        yuzuConfig.set("Cpu", "cpu_accuracy\\default", "false")

        #### System section ####
        if not yuzuConfig.has_section("System"):
            yuzuConfig.add_section("System")

        # Language
        if system.isOptSet('yuzu_language'):
            yuzuConfig.set("System", "language_index", system.config["yuzu_language"])
        else:
            yuzuConfig.set("System", "language_index", YuzuGenerator.getYuzuLangFromEnvironment())
        yuzuConfig.set("System", "language_index\\default", "false")

        # Region
        if system.isOptSet('yuzu_region'):
            yuzuConfig.set("System", "region_index", system.config["yuzu_region"])
        else:
            yuzuConfig.set("System", "region_index", YuzuGenerator.getYuzuRegionFromEnvironment())
        yuzuConfig.set("System", "region_index\\default", "false")

        # Sound Mode
        if system.isOptSet('yuzu_sound_mode'):
            yuzuConfig.set("System", "sound_index", system.config["yuzu_sound_mode"])
        else:
            yuzuConfig.set("System", "sound_index", "1")
        yuzuConfig.set("System", "sound_index\\default", "false")

        # Timezone
        if system.isOptSet('yuzu_timezone'):
            yuzuConfig.set("System", "time_zone_index", system.config["yuzu_timezone"])
        else:
            yuzuConfig.set("System", "time_zone_index", "0")
        yuzuConfig.set("System", "time_zone_index\\default", "false")

        #### Controls section ####
        if not yuzuConfig.has_section("Controls"):
            yuzuConfig.add_section("Controls")

        # Dock Mode
        if system.isOptSet('yuzu_dock_mode'):
            yuzuConfig.set("Controls", "use_docked_mode", system.config["yuzu_dock_mode"])
        else:
            yuzuConfig.set("Controls", "use_docked_mode", "true")
        yuzuConfig.set("Controls", "use_docked_mode\\default", "false")

        # controllers


        #### Telemetry section ####
        if not yuzuConfig.has_section("WebService"):
            yuzuConfig.add_section("WebService")
        yuzuConfig.set("WebService", "enable_telemetry", "false")
        yuzuConfig.set("WebService", "enable_telemetry\\default", "false")

        #### Services section ####
        if not yuzuConfig.has_section("Services"):
            yuzuConfig.add_section("Services")
        yuzuConfig.set("Services", "bcat_backend", "none")
        yuzuConfig.set("Services", "bcat_backend\\default", "none")

        ### update the configuration file
        if not os.path.exists(os.path.dirname(yuzuConfigFile)):
            os.makedirs(os.path.dirname(yuzuConfigFile))
        with open(yuzuConfigFile, 'w') as configfile:
            yuzuConfig.write(configfile)

    @staticmethod
    def getYuzuLangFromEnvironment():
        lang = environ['LANG'][:5]
        availableLanguages = { "en_US": 1, "fr_FR": 2, "de_DE": 3, "it_IT": 4, "es_ES": 5, "nl_NL": 8, "pt_PT": 9 }
        if lang in availableLanguages:
            return availableLanguages[lang]
        else:
            return availableLanguages["en_US"]

    @staticmethod
    def getYuzuRegionFromEnvironment():
        lang = environ['LANG'][:5]
        availableRegions = { "en_US": 1, "ja_JP": 0 }
        if lang in availableRegions:
            return availableRegions[lang]
        else:
            return 2 # europe
