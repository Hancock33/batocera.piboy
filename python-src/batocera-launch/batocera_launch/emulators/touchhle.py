from __future__ import annotations

import logging
import shutil
from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_logger = logging.getLogger(__name__)

_RESOURCE_DIR: Final = Path('/usr/share/touchhle')


def _ensure_readme() -> None:
    readme_path = _RESOURCE_DIR / 'touchHLE_apps' / 'README.txt'
    readme_path.parent.mkdir(parents=True, exist_ok=True)
    readme_path.touch(exist_ok=True)


@cached_dataclass
class Touchhle(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'touchhle',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def needs_mouse(self) -> bool:
        return True

    @property
    def execution_path(self) -> Path | None:
        return self.rom.parent

    async def configure(self) -> Command:
        _ensure_readme()

        base_dir = self.rom.parent

        for base_mkdir in (base_dir / 'touchHLE_apps', base_dir / 'touchHLE_sandbox'):
            base_mkdir.mkdir(parents=True, exist_ok=True)

        for resoure in ('touchHLE_dylibs', 'touchHLE_fonts'):
            shutil.copytree(_RESOURCE_DIR / resoure, base_dir / resoure, dirs_exist_ok=True)

        for relative_path in (
            'touchHLE_options.txt',
            'touchHLE_default_options.txt',
            'OPTIONS_HELP.txt',
            'touchHLE_apps/README.txt',
        ):
            destination = base_dir / relative_path
            if not destination.exists():
                destination.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(_RESOURCE_DIR / relative_path, destination)

        return Command(
            ['/usr/bin/touchHLE', '--fullscreen', self.rom.name],
            env={
                'HOME': str(base_dir),
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            },
        )
