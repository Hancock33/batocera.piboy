from __future__ import annotations

import shutil
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config, write_sdl_controller_db
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext


RESOURCE_DIR = Path("/usr/share/touchhle")


def _ensure_symlink(target: Path, source: Path) -> None:
    if target.is_symlink():
        if target.resolve() == source.resolve():
            return
        target.unlink()
    elif target.exists():
        return

    target.symlink_to(source)


class TouchHLEGenerator(Generator):
    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "touchhle",
            "keys": {"exit": ["KEY_LEFTALT", "KEY_F4"]},
        }

    def executionDirectory(self, config, rom: Path) -> Path | None:
        return rom.parent

    def getMouseMode(self, config, rom: Path) -> bool:
        return True

    def generate(self, system, rom: Path, playersControllers, metadata, guns, wheels, gameResolution):
        base_dir = rom.parent

        (base_dir / "touchHLE_apps").mkdir(parents=True, exist_ok=True)
        (base_dir / "touchHLE_sandbox").mkdir(parents=True, exist_ok=True)

        for resource in ("touchHLE_dylibs", "touchHLE_fonts", "touchHLE_default_options.txt"):
            _ensure_symlink(base_dir / resource, RESOURCE_DIR / resource)

        for relative_path in ("touchHLE_options.txt", "OPTIONS_HELP.txt", "touchHLE_apps/README.txt"):
            destination = base_dir / relative_path
            if not destination.exists():
                destination.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(RESOURCE_DIR / relative_path, destination)

        write_sdl_controller_db(playersControllers)

        return Command.Command(
            array=["/usr/bin/touchHLE", "--fullscreen", rom.name],
            env={
                "HOME": base_dir,
                "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers),
                "SDL_JOYSTICK_HIDAPI": "0",
            },
        )
