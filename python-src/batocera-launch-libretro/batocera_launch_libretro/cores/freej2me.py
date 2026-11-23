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
class Freej2me(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('freej2me_resolution', default='240x320')
        core_options.set_from_config('freej2me_dojaversion', default='200')
        core_options.set_from_config('freej2me_fps', default='60')

        # Display
        core_options.set_from_config('freej2me_rotate', default='0')
        core_options.set_from_config('freej2me_backlightcolor', default='Green')
        core_options.set_from_config('freej2me_textfont', default='off')
        core_options.set_from_config('freej2me_fontoffset', default='0')

        # Audio
        core_options.set_from_config('freej2me_sound', default='on')
        core_options.set_from_config('freej2me_midifont', default='off')
        core_options.set_from_config('freej2me_numsynths', default='4')

        # Controls
        core_options.set_from_config('freej2me_phone', default='Default')
        core_options.set_from_config('freej2me_analogasentirekeypad', default='off')
        core_options.set_from_config('freej2me_pointertype', default='Mouse')
        core_options.set_from_config('freej2me_pointerxspeed', default='4')
        core_options.set_from_config('freej2me_pointeryspeed', default='4')
        core_options.set_from_config('freej2me_pointerinnercolor', default='White')
        core_options.set_from_config('freej2me_pointeroutercolor', default='Black')
        core_options.set_from_config('freej2me_pointerclickcolor', default='Yellow')

        # Advanced Options
        core_options.set_from_config('freej2me_m3gantialiasmode', default='app')
        core_options.set_from_config('freej2me_m3gbilinearmode', default='app')
        core_options.set_from_config('freej2me_m3gditheringmode', default='app')
        core_options.set_from_config('freej2me_m3gperspcorrmode', default='app')
        core_options.set_from_config('freej2me_m3gperspcorrfact', default='high')
        core_options.set_from_config('freej2me_m3gmipmapmode', default='app')
        core_options.set_from_config('freej2me_m3gdisablefog', default='off')
        core_options.set_from_config('freej2me_spdhackm3ghalfres', default='off')
        core_options.set_from_config('freej2me_spdhackmcv3halfres', default='off')
        core_options.set_from_config('freej2me_spdhackmcv3nolight', default='off')
        core_options.set_from_config('freej2me_spdhacknoalpha', default='off')
        core_options.set_from_config('freej2me_spdhackfpsunlock', default='0')
        core_options.set_from_config('freej2me_compatfantasyzonefix', default='off')
        core_options.set_from_config('freej2me_compattranstooriginongfxreset', default='off')
        core_options.set_from_config('freej2me_compatimmediaterepaintcalls', default='off')
        core_options.set_from_config('freej2me_compatrepaintonsetcurrent', default='off')
        core_options.set_from_config('freej2me_compatnotranslatedrawrgb', default='off')
        core_options.set_from_config('freej2me_compatoverrideplatcheck', default='on')
        core_options.set_from_config('freej2me_compatsiemensfriendlydraw', default='off')
        core_options.set_from_config('freej2me_compatignorevolumechanges', default='off')
        core_options.set_from_config('freej2me_compatmcv3horfovfix', default='off')
        core_options.set_from_config('freej2me_deletetempkjxfiles', default='on')
