from __future__ import annotations

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import Core, GLForceMixin


# The core asks for a compatibility OpenGL 2.1 context, which glcore cannot give
@cached_dataclass
class Nuance(GLForceMixin, Core):
    pass
