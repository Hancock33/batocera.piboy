from __future__ import annotations

from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...utils import videoMode as videoMode
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class EtekwarGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        # ini file
        config_dir = Path('/userdata/system/configs/tekwar')
        config_dir.mkdir(exist_ok=True)

        iniFile = config_dir / 'tekwar.ini'
        if iniFile.exists():
            iniFile.unlink()

        gameResolution = videoMode.getCurrentResolution()

        with Path(iniFile).open("a", encoding="ascii") as f:
            f.write(
                "fullscreen = 1\n"
                f"xdim = {gameResolution['width']}\n"
                f"ydim = {gameResolution['height']}\n"
                "renderer = 3\n"
                "music = 1\n"
                "mouse = 1\n"
                "joystick = 0\n"
                "keyforward = C8\n"
                "keybackward = D0\n"
                "keyturnleft = CB\n"
                "keyturnright = CD\n"
                "keyrun = 2A\n"
                "keystrafe = 38\n"
                "keyfire = 1D\n"
                "keyuse = 39\n"
                "keystandhigh = 2D\n"
                "keystandlow = 2E\n"
                "keylookup = C9\n"
                "keylookdown = D1\n"
                "keystrafeleft = 33\n"
                "keystraferight = 34\n"
                "key2dmode = 20\n"
                "keyviewcycle = 9C\n"
                "key2dzoomin = 1A\n"
                "key2dzoomout = 1B\n"
                "keychat = 32\n"
                "keyconsole = C7\n"
            )

        commandArray = ["etekwar"]

        return Command.Command(array=commandArray)

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "etekwar",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
