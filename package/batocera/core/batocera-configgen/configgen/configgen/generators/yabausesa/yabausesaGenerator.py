#!/usr/bin/env python
import shutil
import os
import Command
from generators.Generator import Generator
import controllersConfig


class YabausesaGenerator(Generator):
    if not os.path.exists('/userdata/system/configs/yabasanshiro'):
        os.makedirs('/userdata/system/configs/yabasanshiro')

    shutil.copyfile('/usr/share/yabasanshiro/keymapv2.json', '/userdata/system/configs/yabasanshiro/keymapv2.json')

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["/usr/bin/yabausesa"]
        
        if system.isOptSet("yabausesa_resolution"):
            commandArray.append("-r")
            commandArray.append(system.config['yabausesa_resolution'])

        if system.isOptSet("yabausesa_rotate_resolution"):
            commandArray.append("-rr")
            commandArray.append(system.config['yabausesa_rotate_resolution'])

        if system.isOptSet("yabausesa_keep_ar"):
            if system.config['yabausesa_keep_ar'] == '1':
                commandArray.append("-a")

        if system.isOptSet("yabausesa_scps_sync_per_frame"):
            commandArray.append("-s")
            commandArray.append(system.config['yabausesa_scps_sync_per_frame'])

        if system.isOptSet("yabausesa_frame"):
            if system.config['yabausesa_frame'] == '1':
                commandArray.append("-nf")

        commandArray.append("-i")
        commandArray.append(rom)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
