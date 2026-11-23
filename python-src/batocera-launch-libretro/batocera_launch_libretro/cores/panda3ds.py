# This file is part of The Batocera Linux Distribution (https://batocera.org).
# Copyright (c) 2026 The Batocera Team.
#
# The Batocera Linux Distribution is free software: you can redistribute it
# and/or modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# The Batocera Linux Distribution is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with The Batocera Linux Distribution. If not, see
# <https://www.gnu.org/licenses/>.
#
# YOU MUST RETAIN THE LICENSE AND COPYRIGHT NOTICES ABOVE IN ANY
# REDISTRIBUTED VERSION OF THIS FILE.

from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import RACore

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


_BATTERY_LEVELS = (5, 10, 20, 30, 50, 70, 90, 100)


@cached_dataclass
class Panda3ds(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # The core only accepts enabled/disabled; get_bool also maps the 1/0 an older ES switch menu saved.
        def set_switch(name: str, default: bool) -> None:
            core_options.set_bool_from_config(name, default=default, values=('enabled', 'disabled'))

        # System
        set_switch('panda3ds_use_virtual_sd', True)
        set_switch('panda3ds_write_protect_virtual_sd', False)
        # Only 5|10|20|30|50|70|90|100 are offered; snap older slider values down to the nearest one
        battery = max(self.config.get_int('panda3ds_battery_level', 5), _BATTERY_LEVELS[0])
        core_options.set('panda3ds_battery_level', str(max(level for level in _BATTERY_LEVELS if level <= battery)))
        set_switch('panda3ds_use_charger', True)

        # Display
        set_switch('panda3ds_use_vsync', True)
        set_switch('panda3ds_use_ubershader', True)
        set_switch('panda3ds_ubershader_lighting_override', True)
        core_options.set_from_config('panda3ds_ubershader_lighting_override_threshold', default='1')

        # Audio
        set_switch('panda3ds_use_audio', True)
        core_options.set_from_config('panda3ds_dsp_emulation', default='HLE')

        # Advanced Options
        set_switch('panda3ds_use_shader_jit', True)
        set_switch('panda3ds_accurate_shader_mul', False)
