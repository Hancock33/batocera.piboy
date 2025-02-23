from __future__ import annotations

import filecmp
import logging
import os
import re
import shutil
import sys
from pathlib import Path
from typing import TYPE_CHECKING

import toml

from ... import Command
from ...batoceraPaths import CACHE, CONFIGS, HOME, SAVES, mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ...utils import vulkan, wine
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

_logger = logging.getLogger(__name__)

class XeniaGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "xenia",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    @staticmethod
    def sync_directories(source_dir: Path, dest_dir: Path):
        dcmp = filecmp.dircmp(source_dir, dest_dir)
        # Files that are only in the source directory or are different
        differing_files = dcmp.diff_files + dcmp.left_only
        for file in differing_files:
            src_path = source_dir / file
            dest_path = dest_dir / file
            # Copy and overwrite the files from source to destination
            shutil.copy2(src_path, dest_path)

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        rom_path = Path(rom)

        wineprefix = HOME / 'wine-bottles' / 'xbox360'
        xeniaConfig = CONFIGS / 'xenia'
        xeniaCache = CACHE / 'xenia'
        xeniaSaves = SAVES / 'xbox360'
        emupath = wineprefix / 'xenia'
        canarypath = wineprefix / 'xenia-canary'

        core = system.config['core']

        # check Vulkan first before doing anything
        if vulkan.is_available():
            _logger.debug("Vulkan driver is available on the system.")
            vulkan_version = vulkan.get_version()
            if vulkan_version > "1.3":
                _logger.debug("Using Vulkan version: %s", vulkan_version)
            else:
                if system.isOptSet('xenia_api') and system.config['xenia_api'] == "D3D12":
                    _logger.debug("Vulkan version: %s is not compatible with Xenia when using D3D12", vulkan_version)
                    _logger.debug("You may have performance & graphical errors, switching to native Vulkan")
                    system.config['xenia_api'] = "Vulkan"
                else:
                    _logger.debug("Vulkan version: %s is not recommended with Xenia", vulkan_version)
        else:
            _logger.debug("*** Vulkan driver required is not available on the system!!! ***")
            sys.exit()

        # set to 64bit environment by default
        os.environ['WINEARCH'] = 'win64'

        # make system directories
        mkdir_if_not_exists(wineprefix)
        mkdir_if_not_exists(xeniaConfig)
        mkdir_if_not_exists(xeniaCache)
        mkdir_if_not_exists(xeniaSaves)

        # create dir & copy xenia exe to wine bottle as necessary
        if not emupath.exists():
            shutil.copytree('/usr/bin/xenia', emupath)
        if not canarypath.exists():
            shutil.copytree('/usr/bin/xenia-canary', canarypath)
        # check binary then copy updated xenia exe's as necessary
        if not filecmp.cmp('/usr/bin/xenia/xenia.exe', emupath / 'xenia.exe'):
            shutil.copytree('/usr/bin/xenia', emupath, dirs_exist_ok=True)
        # xenia canary - copy patches directory also
        if not filecmp.cmp('/usr/bin/xenia-canary/xenia_canary.exe', canarypath / 'xenia_canary.exe'):
            shutil.copytree('/usr/bin/xenia-canary', canarypath, dirs_exist_ok=True)
        if not (canarypath / 'patches').exists():
            shutil.copytree('/usr/bin/xenia-canary', canarypath, dirs_exist_ok=True)
        # update patches accordingly
        self.sync_directories(Path('/usr/bin/xenia-canary'), canarypath)

        # create portable txt file to try & stop file spam
        if not (emupath / 'portable.txt').exists():
            with (emupath / 'portable.txt').open('w'):
                pass
        if not (canarypath / 'portable.txt').exists():
            with (canarypath / 'portable.txt').open('w'):
                pass

        wine.install_wine_trick(wineprefix, 'xeniadisclaimer')
        wine.install_wine_trick(wineprefix, 'vcrun2019')

        dll_files = ["d3d12.dll", "d3d12core.dll", "d3d11.dll", "d3d10core.dll", "d3d9.dll", "d3d8.dll", "dxgi.dll"]
        # Create symbolic links for 64-bit DLLs
        try:
            for dll in dll_files:
                src_path = wine.WINE_BASE / "dxvk" / "x64" / dll
                dest_path = wineprefix / "drive_c" / "windows" / "system32" / dll
                # Remove existing link if it already exists
                if dest_path.exists() or dest_path.is_symlink():
                    dest_path.unlink()
                dest_path.symlink_to(src_path)
        except Exception as e:
            _logger.debug("Error creating 64-bit link for %s: %s", dll, e)

        # Create symbolic links for 32-bit DLLs
        try:
            for dll in dll_files:
                src_path = wine.WINE_BASE / "dxvk" / "x32" / dll
                dest_path = wineprefix / "drive_c" / "windows" / "syswow64" / dll
                # Remove existing link if it already exists
                if dest_path.exists() or dest_path.is_symlink():
                    dest_path.unlink()
                dest_path.symlink_to(src_path)
        except Exception as e:
            _logger.debug("Error creating 32-bit link for %s: %s", dll, e)

        # squashfs
        if "/squashfs" in rom:
            squashrom = rom + rom.replace('/var/run/squashfs','') + '.xbox360'
            if os.path.exists(squashrom):
                rom_path = Path(squashrom)
                _logger.debug('Found squashfs playlist %s:', rom_path)

        # are we loading a digital title?
        if rom_path.suffix == '.xbox360':
            _logger.debug('Found .xbox360 playlist: %s', rom)
            pathLead = rom_path.parent
            with rom_path.open() as openFile:
                # Read only the first line of the file.
                firstLine = openFile.readlines(1)[0]
                # Strip of any new line characters.
                firstLine = firstLine.strip('\n').strip('\r')
                _logger.debug('Checking if specified disc installation / XBLA file actually exists...')
                xblaFullPath = pathLead / firstLine
                if xblaFullPath.exists():
                    _logger.debug('Found! Switching active rom to: %s', firstLine)
                    rom_path = xblaFullPath
                    rom = str(xblaFullPath)
                else:
                    _logger.error('Disc installation/XBLA title %s from %s not found, check path or filename.', firstLine, rom)

        # adjust the config toml file accordingly
        config = {}
        if core == 'xenia-canary':
            toml_file = canarypath / 'xenia-canary.config.toml'
            os.chdir(Path(canarypath))
        else:
            toml_file = emupath / 'xenia.config.toml'
            os.chdir(Path(emupath))
        if toml_file.is_file():
            with toml_file.open() as f:
                config = toml.load(f)

        # [ Now adjust the config file defaults & options we want ]
        # add node CPU
        if 'CPU' not in config:
            config['CPU'] = {}
        # hack, needed for certain games
        config['CPU'] = {'break_on_unimplemented_instructions': False}
        # add node Content
        if 'Content' not in config:
            config['Content'] = {}
        # default 1 = First license enabled. Generally the full version license in Xbox Live Arcade (XBLA) titles.
        if system.isOptSet('xenia_license'):
            config['Content'] = {'license_mask': int(system.config['xenia_license'])}
        else:
            config['Content'] = {'license_mask': 1}
        # add node D3D12
        if 'D3D12' not in config:
            config['D3D12'] = {}
        # readback resolve
        if system.isOptSet('xenia_readback_resolve') and system.config['xenia_readback_resolve'] == 'True':
            config['D3D12']['d3d12_readback_resolve'] = True
        else:
            config['D3D12']['d3d12_readback_resolve'] = False
        # add node Display
        if 'Display' not in config:
            config['Display'] = {}
        # always run fullscreen & set internal resolution - default 1280x720
        displayRes = 8
        if system.isOptSet('xenia_resolution'):
            displayRes = int(system.config['xenia_resolution'])
        config['Display'] = {
            'fullscreen': True,
            'internal_display_resolution': displayRes}
        # add node GPU
        if 'GPU' not in config:
            config['GPU'] = {}
        # may be used to bypass fetch constant type errors in certain games.
        # set the API to use
        if system.isOptSet('xenia_api') and system.config['xenia_api'] == 'D3D12':
            config['GPU']['gpu'] = 'd3d12'
        else:
            config['GPU']['gpu'] = 'vulkan'
        # vsync
        if system.isOptSet('xenia_vsync') and system.config['xenia_vsync'] == 'False':
            config['GPU']['vsync'] = False
        else:
            config['GPU']['vsync'] = True
        config['GPU']['framerate_limit'] = int(system.config.get('xenia_vsync_fps', 0))
        # page state
        if system.isOptSet('xenia_page_state') and system.config['xenia_page_state'] == 'True':
            config['GPU']['clear_memory_page_state'] = True
        else:
            config['GPU']['clear_memory_page_state'] = False
        # render target path
        config['GPU']['render_target_path_d3d12'] = system.config.get('xenia_target_path', 'rtv')
        # query occlusion
        config['GPU']['query_occlusion_fake_sample_count'] = int(system.config.get('xenia_query_occlusion', 1000))
        # cache
        config['GPU']['texture_cache_memory_limit_hard'] = int(system.config.get('xenia_limit_hard', 768))
        config['GPU']['texture_cache_memory_limit_render_to_texture'] = int(system.config.get('xenia_limit_render_to_texture', 24))
        config['GPU']['texture_cache_memory_limit_soft'] = int(system.config.get('xenia_limit_soft', 384))
        config['GPU']['texture_cache_memory_limit_soft_lifetime'] = int(system.config.get('xenia_limit_soft_lifetime', 30))
        # add node General
        if 'General' not in config:
            config['General'] = {}
        # disable discord
        config['General']['discord'] = False
        # patches
        if system.isOptSet('xenia_patches') and system.config['xenia_patches'] == 'True':
            config['General'] = {'apply_patches': True}
        else:
            config['General'] = {'apply_patches': False}
        # add node HID
        if 'HID' not in config:
            config['HID'] = {}
        # ensure we use sdl for controllers
        config['HID'] = {'hid': 'sdl'}
        # add node Logging
        if 'Logging' not in config:
            config['Logging'] = {}
        # reduce log spam
        config['Logging'] = {
            'log_level': 1
            }
        # add node Memory
        if 'Memory' not in config:
            config['Memory'] = {}
        # certain games require this to set be set to false to work around crashes.
        config['Memory'] = {'protect_zero': False}
        # add node Storage
        if 'Storage' not in config:
            config['Storage'] = {}
        # certain games require this to set be set to true to work around crashes.
        config['Storage'] = {
            'cache_root': str(xeniaCache),
            'content_root': str(xeniaSaves),
            'mount_scratch': True,
            'storage_root': str(xeniaConfig)
            }
        # mount cache
        if system.isOptSet('xenia_cache') and system.config['xenia_cache'] == 'False':
            config['Storage']['mount_cache'] = False
        else:
            config['Storage']['mount_cache'] = True

        # add node UI
        if 'UI' not in config:
            config['UI'] = {}
        # run headless ?
        if system.isOptSet('xenia_headless') and system.config['xenia_headless'] == 'True':
            config['UI']['headless'] = True
        else:
            config['UI']['headless'] = False
        # achievements
        if system.isOptSet('xenia_achievement') and system.config['xenia_achievement'] == 'True':
            config['UI']['show_achievement_notification'] = True
        else:
            config['UI']['show_achievement_notification'] = False
        # add node Vulkan
        if 'Vulkan' not in config:
            config['Vulkan'] = {}
        config['Vulkan'] = {'vulkan_sparse_shared_memory': False}
        # add node XConfig
        if 'XConfig' not in config:
            config['XConfig'] = {}
        # console country
        if system.isOptSet('xenia_country'):
            config['XConfig'] = {'user_country': int(system.config['xenia_country'])}
        else:
            config['XConfig'] = {'user_country': 103} # US
        # language
        if system.isOptSet('xenia_language'):
            config['XConfig'] = {'user_language': int(system.config['xenia_language'])}
        else:
            config['XConfig'] = {'user_language': 1}

        # now write the updated toml
        with toml_file.open('w') as f:
            toml.dump(config, f)

        # handle patches files to set all matching toml files keys to true
        rom_name = rom_path.stem
        # simplify the name for matching
        rom_name = re.sub(r'\[.*?\]', '', rom_name)
        rom_name = re.sub(r'\(.*?\)', '', rom_name)
        if system.isOptSet('xenia_patches') and system.config['xenia_patches'] == 'True':
            # pattern to search for matching .patch.toml files
            pattern = canarypath / 'patches' / f'*{rom_name}*.patch.toml'
            matching_files = [file_path for file_path in (canarypath / 'patches').glob(f'*{rom_name}*.patch.toml') if re.search(rom_name, file_path.name, re.IGNORECASE)]
            if matching_files:
                for file_path in matching_files:
                    _logger.debug('Enabling patches for: %s', file_path)
                    # load the matchig .patch.toml file
                    with file_path.open('r') as f:
                        patch_toml = toml.load(f)
                    # modify all occurrences of the `is_enabled` key to `true`
                    for patch in patch_toml.get('patch', []):
                        if 'is_enabled' in patch:
                            patch['is_enabled'] = True
                    # save the updated .patch.toml file
                    with file_path.open('w') as f:
                        toml.dump(patch_toml, f)
            else:
                _logger.debug('No patch file found for %s', rom_name)

        # now setup the command array for the emulator
        if rom == 'config':
            if core == 'xenia-canary':
                commandArray = [wine.WINE64, canarypath / 'xenia_canary.exe']
            else:
                commandArray = [wine.WINE64, emupath / 'xenia.exe']
        else:
            if core == 'xenia-canary':
                commandArray = [wine.WINE64, canarypath / 'xenia_canary.exe', f'z:{rom}']
            else:
                commandArray = [wine.WINE64, emupath / 'xenia.exe', f'z:{rom}']

        environment = wine.get_wine_environment(wineprefix)
        environment.update({
            'LD_LIBRARY_PATH': f'/usr/lib:{environment["LD_LIBRARY_PATH"]}',
            'LIBGL_DRIVERS_PATH': '/usr/lib/dri',
            'WINEFSYNC': '1',
            'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers),
            'SDL_JOYSTICK_HIDAPI': '0',
            'VKD3D_SHADER_CACHE_PATH': xeniaCache,
            'WINEDLLOVERRIDES': "winemenubuilder.exe=;dxgi,d3d8,d3d9,d3d10core,d3d11,d3d12,d3d12core=n",
        })

        # ensure nvidia driver used for vulkan
        if Path('/var/tmp/nvidia.prime').exists():
            variables_to_remove = ['__NV_PRIME_RENDER_OFFLOAD', '__VK_LAYER_NV_optimus', '__GLX_VENDOR_LIBRARY_NAME']
            for variable_name in variables_to_remove:
                if variable_name in os.environ:
                    del os.environ[variable_name]

            environment.update(
                {
                    'VK_ICD_FILENAMES': '/usr/share/vulkan/icd.d/nvidia_icd.x86_64.json',
                    'VK_LAYER_PATH': '/usr/share/vulkan/explicit_layer.d'
                }
            )

        return Command.Command(array=commandArray, env=environment)

    # Show mouse on screen when needed
    # xenia auto-hides
    def getMouseMode(self, config, rom):
        return True
