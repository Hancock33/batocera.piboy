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

from typing import TYPE_CHECKING, ClassVar

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import Core, SquashFSMixin

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class Pocketsnes(SquashFSMixin, Core):
    squashfs_rom_globs: ClassVar = {
        'snes-msu1': ('*.sfc', '*.smc'),
        'satellaview': ('*.sfc', '*.smc'),
    }

    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('snes9x2002_transparency', default='enabled')
        # Audio
        core_options.set_from_config('snes9x2002_low_pass_filter', default='disabled')
        core_options.set_from_config('snes9x2002_low_pass_range', default='60')
        # Advanced Options
        core_options.set_from_config('snes9x2002_frameskip', default='disabled')
        core_options.set_from_config('snes9x2002_frameskip_threshold', default='33')
        core_options.set_from_config('snes9x2002_frameskip_interval', default='1')
        core_options.set_from_config('snes9x2002_overclock_cycles', default='disabled')
