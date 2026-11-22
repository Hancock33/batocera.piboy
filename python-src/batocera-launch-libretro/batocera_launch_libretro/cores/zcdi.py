from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import RACore

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class Zcdi(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('zcdi_preferred_bios', default='ntsc')
        core_options.set_from_config('zcdi_dvc_enabled', default='auto')
        core_options.set_from_config('zcdi_auto_play', default='off')
        core_options.set_from_config('zcdi_nvram_mode', default='per_disc')
