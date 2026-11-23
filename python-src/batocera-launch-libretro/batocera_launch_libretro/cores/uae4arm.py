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
from batocera_common.paths import BIOS
from batocera_launch_libretro import Core

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class Uae4arm(Core):
    def set_config(self, custom_config: LibretroConfig, /) -> None:
        super().set_config(custom_config)

        # AMIGA BIOS files are in /userdata/bios/amiga
        custom_config.set('system_directory', f'{BIOS / "amiga"}/')

    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('uae4arm_model', default='Auto')
        core_options.set_from_config('uae4arm_fastmem', default='None')
        core_options.set_from_config('uae4arm_floppy_speed', default='100')
        core_options.set_from_config('uae4arm_whdloadmode', default='files')

        # Display
        core_options.set_from_config('uae4arm_resolution', default='768x270')
        core_options.set_from_config('uae4arm_leds_on_screen', default='on')
        core_options.set_from_config('uae4arm_linedoubling', default='off')

        # Advanced Options
        # The core default depends on the board (off on Raspberry Pi 4/5), so only set it when configured
        if (fast_copper := self.config.get_str('uae4arm_fastcopper')) is not None:
            core_options.set('uae4arm_fastcopper', fast_copper)
