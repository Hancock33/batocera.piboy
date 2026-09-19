from __future__ import annotations

import json
from pathlib import Path

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

yabConfigPath = Path('/userdata/system/configs/yabasanshiro')


YABA_CTRL_MAP: dict[str, str] = {
    'start':          'start',
    'select':         'select',
    'a':              'b',
    'b':              'a',
    'pageup':         'c',
    'x':              'y',
    'y':              'x',
    'pagedown':       'z',
    'up':             'up',
    'down':           'down',
    'left':           'left',
    'right':          'right',
    'l2':             'l',
    'r2':             'r',
    'joystick1up':    'analogy',
    'joystick1left':  'analogx',
}


@cached_dataclass
class Yabasanshiro(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'yabasanshiro',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        yabConfigPath.mkdir(parents=True, exist_ok=True)

        config_file = yabConfigPath / f'{self.rom.stem}.config'
        ctrl_config_file = yabConfigPath / 'keymapv2.json'

        if config_file.exists():
            with config_file.open() as f:
                config = json.load(f)
        else:
            config = {
                'Aspect rate': 0,
                'Resolution': 0,
                'Rotate screen': False,
                'Rotate screen resolution': 0,
                'Use compute shader': False,
            }

        # Apply current system settings on top of whatever was loaded
        config['Aspect rate'] = self.config.get_int('yaba_aspect', 0)
        config['Resolution'] = self.config.get_int('yaba_resolution', 3)
        config['Rotate screen'] = False
        config['Rotate screen resolution'] = 0
        config['Use compute shader'] = self.config.get_bool('yaba_shader', False)

        with config_file.open('w') as f:
            json.dump(config, f, indent=2)

        # Configure the first two controllers
        data: dict = {}
        for pad in self.controllers[:2]:
            ctrl_id = f'{pad.index}_{pad.real_name}_{pad.guid}'
            data.setdefault(ctrl_id, {})

            player_index = int(pad.index) + 1
            pad_mode = self.config.get_int(f'yaba_player{player_index}', 0)

            player_key = f'player{player_index}'
            data[player_key] = {
                'DeviceID': int(pad.index),
                'deviceGUID': pad.guid,
                'deviceName': pad.real_name,
                'padmode': pad_mode,
            }

            for input_name, input in pad.inputs.items():
                if input_name not in YABA_CTRL_MAP:
                    continue

                if input_name == 'joystick1left':
                    data[ctrl_id]['analogleft'] = {'id': 4, 'type': 'axis', 'value': 0}
                    data[ctrl_id]['analogright'] = {'id': 5, 'type': 'axis', 'value': 0}

                data[ctrl_id][YABA_CTRL_MAP[input_name]] = {
                    'id': int(input.id),
                    'type': input.type,
                    'value': int(input.value),
                }

        with ctrl_config_file.open('w') as f:
            json.dump(data, f, indent=2)

        return Command(
            ['/usr/bin/yabasanshiro/yabasanshiro', '-i', self.rom],
            env={
                'LD_LIBRARY_PATH': '/usr/bin/yabasanshiro:/usr/lib:/lib'
            },
        )
