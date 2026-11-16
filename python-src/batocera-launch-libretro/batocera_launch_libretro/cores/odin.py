from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass
from batocera_common.paths import BIOS
from batocera_launch_libretro import Core, GLCoreForceMixin

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig

# The shared MAME sets the core reads from <system directory>/odin
_SHARED_SETS: Final = ('hikaru.zip', 'mie.zip', 'jvs13551.zip', '18wheelr.zip', 'srally2.zip')


@cached_dataclass
class Odin(GLCoreForceMixin, Core):
    def generate_special_configs(self) -> None:
        super().generate_special_configs()

        # The core looks for the shared sets in <system directory>/odin, Batocera keeps them in bios/
        odin_dir = BIOS / 'odin'
        odin_dir.mkdir(parents=True, exist_ok=True)

        for name in _SHARED_SETS:
            link = odin_dir / name

            if link.is_symlink():
                link.unlink()
            elif link.exists():
                continue  # a real file put there by the user

            if (source := BIOS / name).exists():
                link.symlink_to(source)

    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        core_options.set_from_config('odin_renderer', default='auto')
        core_options.set_from_config('odin_scale', default='1')
        core_options.set_from_config('odin_upscale_mode', default='snap')
        core_options.set_from_config('odin_anisotropy', default='1')
        core_options.set_from_config('odin_threaded', default='enabled')
        core_options.set_from_config('odin_rumble', default='enabled')
