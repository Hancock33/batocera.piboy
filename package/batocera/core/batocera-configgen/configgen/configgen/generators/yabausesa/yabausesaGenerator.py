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

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["/usr/bin/yabausesa", "-i", rom]

        rom_name = os.path.basename(rom)

        f = open('/userdata/system/configs/yabasanshiro/' + rom_name + '.config', 'w')
        f.write('{' + '\n')

        if system.isOptSet("yabausesa_keep_ar"):
            f.write('  "Aspect rate": ' + system.config['yabausesa_keep_ar'] + ',\n')
        else:
            f.write('  "Aspect rate": 0,' + '\n')

        if system.isOptSet("yabausesa_resolution"):
            f.write('  "Resolution": ' + system.config['yabausesa_resolution'] + ',\n')
        else:
            f.write('  "Resolution": 2,' + '\n')

        if system.isOptSet("yabausesa_rotate"):
            f.write('  "Rotate screen": ' + system.config['yabausesa_rotate'].lower() + ',\n')
        else:
            f.write('  "Rotate screen": false,' + '\n')

        if system.isOptSet("yabausesa_rotate_resolution"):
            f.write('  "Rotate screen resolution": ' + system.config['yabausesa_rotate_resolution'] + ',\n')
        else:
            f.write('  "Rotate screen resolution": 0,' + '\n')

        if system.isOptSet("yabausesa_scps_sync_per_frame"):
            f.write('  "Use compute shader": ' + system.config['yabausesa_scps_sync_per_frame'].lower() + ',\n')
        else:
            f.write('  "Use compute shader": false' + '\n')

        f.write('}')
        f.close()

        if system.isOptSet("yabausesa_frameskip"):
            if system.config['yabausesa_frameskip'] == 'False':
                commandArray.append("-nf")

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
