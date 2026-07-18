from __future__ import annotations

import pathlib

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ...utils import videoMode as videoMode
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class EtekwarGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["etekwar"]

        # ini file
        config_dir = '/userdata/system/configs/tekwar'
        if not pathlib.Path(config_dir).exists():
            pathlib.Path(config_dir).mkdir()

        iniFile = config_dir + '/tekwar.ini'
        if pathlib.Path(iniFile).exists():
            pathlib.Path(iniFile).unlink()          # Force removing tekwar.ini

        f = pathlib.Path(iniFile).open("a", encoding="ascii")
        f.write('fullscreen = 1\n')
        f.write('xdim = ' + str(gameResolution["width"]) + '\n')
        f.write('ydim = ' + str(gameResolution["height"]) + '\n')
        f.write('renderer = 3\n')
        f.write('music = 1\n')
        f.write('mouse = 1\n')
        f.write('joystick = 0\n')
        f.write('keyforward = C8\n')    #Up Arrow
        f.write('keybackward = D0\n')   #Down Arrow
        f.write('keyturnleft = CB\n')   #Left Arrow
        f.write('keyturnright = CD\n')  #Right Arrow
        f.write('keyrun = 2A\n')        #Left Shift
        f.write('keystrafe = 38\n')     #Left Alt
        f.write('keyfire = 1D\n')       #Left Ctrl
        f.write('keyuse = 39\n')        #Space
        f.write('keystandhigh = 2D\n')  #X
        f.write('keystandlow = 2E\n')   #C
        f.write('keylookup = C9\n')     #PGUP
        f.write('keylookdown = D1\n')   #PGDN
        f.write('keystrafeleft = 33\n') #,
        f.write('keystraferight = 34\n')#.
        f.write('key2dmode = 20\n')     #D
        f.write('keyviewcycle = 9C\n')  #KP Enter
        f.write('key2dzoomin = 1A\n')   #[
        f.write('key2dzoomout = 1B\n')  #]
        f.write('keychat = 32\n')       #M
        f.write('keyconsole = C7\n')    #Home
        f.close()

        return Command.Command(array=commandArray)

    def getHotkeysContext(self):
        return {
            "name": "etekwar",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
