from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import RACore

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig

_ANYGM_DEFAULTS: Final = {
    # Video
    'anygm_scene_renderer': 'CPU',
    'anygm_content_shader_readback': 'Off (but report available)',
    'anygm_alpha_cull': 'High',
    'anygm_render_game_resolution': 'On',
    'anygm_width_resolution': 'Game Base',
    'anygm_height_resolution': 'Game Base',
    'anygm_aspect_ratio_force': 'None',
    # Input
    'anygm_gamepad': 'Game gamepad',
    'anygm_mouse': 'Auto',
    # System
    'anygm_language': 'Auto',
    'anygm_region': 'Auto',
    # Development
    'anygm_content_overrides': 'On',
    'anygm_clear_local_data': 'Off',
    'anygm_clear_game_cache': 'On',
    'anygm_clear_all_caches': 'On',
}


@cached_dataclass
class AnyGM(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        for name, default in _ANYGM_DEFAULTS.items():
            core_options.set_from_config(name, default=default)

        # Automatic fits the image to a 4:3 TV when RetroArch's CRT SwitchRes is on
        # (the Batocera CRT Script sets global.retroarch.crt_switch_resolution)
        crt_tv = self.config.get_str('anygm_adjust_crt_tv', 'auto')
        if crt_tv not in ('On', 'Off'):
            crt = self.config.get_str('retroarch.crt_switch_resolution', '0') not in ('', '0')
            crt_tv = 'On' if crt else 'Off'
        core_options.set('anygm_adjust_crt_tv', crt_tv)
