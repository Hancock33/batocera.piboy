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


@cached_dataclass
class Noods(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('noods_directBoot', default='enabled')
        core_options.set_from_config('noods_dsiMode', default='disabled')
        # Display
        core_options.set_from_config('noods_screenArrangement', default='Automatic')
        core_options.set_from_config('noods_screenRotation', default='Normal')
        core_options.set_from_config('noods_screenSizing', default='Even')
        core_options.set_from_config('noods_screenPosition', default='Center')
        core_options.set_from_config('noods_screenGap', default='None')
        core_options.set_from_config('noods_gbaCrop', default='enabled')
        core_options.set_from_config('noods_screenFilter', default='Nearest')
        core_options.set_from_config('noods_screenGhost', default='disabled')
        core_options.set_from_config('noods_highRes3D', default='disabled')
        # Audio
        core_options.set_from_config('noods_emulateAudio', default='enabled')
        core_options.set_from_config('noods_audio16Bit', default='enabled')
        core_options.set_from_config('noods_micInputMode', default='Silence')
        # Controls
        core_options.set_from_config('noods_swapScreenMode', default='Toggle')
        core_options.set_from_config('noods_touchMode', default='Auto')
        core_options.set_from_config('noods_touchCursor', default='enabled')
        core_options.set_from_config('noods_cursorTimeout', default='3 Seconds')
        core_options.set_from_config('noods_micButtonMode', default='Toggle')
        # Advanced Options
        core_options.set_from_config('noods_fpsLimiter', default='disabled')
        core_options.set_from_config('noods_frameskip', default='disabled')
        core_options.set_from_config('noods_romInRam', default='disabled')
        core_options.set_from_config('noods_arm7Hle', default='disabled')
        core_options.set_from_config('noods_threaded2D', default='enabled')
        core_options.set_from_config('noods_threaded3D', default='1 Thread')
