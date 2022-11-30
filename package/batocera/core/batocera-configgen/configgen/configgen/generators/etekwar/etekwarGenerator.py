#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig
import utils.videoMode as videoMode

class EtekwarGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["etekwar"]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        # ini file
        iniFile = '/userdata/system/configs/tekwar/tekwar.ini'
        if os.path.exists(iniFile):
            os.remove(iniFile)          # Force removing tekwar.ini

        f = open(iniFile, "a", encoding="ascii")
        f.write('fullscreen = 1\n')
        f.write('xdim = ' + str(gameResolution["width"]) + '\n')
        f.write('ydim = ' + str(gameResolution["height"]) + '\n')
        f.write('renderer = 3\n')
        f.write('music = 1\n')
        f.write('mouse = 1\n')
        f.write('joystick = 0\n')
        f.write('keyforward = C8\n')
        f.write('keybackward = D0\n')
        f.write('keyturnleft = CB\n')
        f.write('keyturnright = CD\n')
        f.write('keyrun = 2A\n')
        f.write('keystrafe = 38\n')
        f.write('keyfire = 1D\n')
        f.write('keyuse = 39\n')
        f.write('keystandhigh = 2D\n')
        f.write('keystandlow = 2E\n')
        f.write('keylookup = C9\n')
        f.write('keylookdown = D1\n')
        f.write('keystrafeleft = 33\n')
        f.write('keystraferight = 34\n')
        f.write('key2dmode = F\n')
        f.write('keyviewcycle = 9C\n')
        f.write('key2dzoomin = D\n')
        f.write('key2dzoomout = C\n')
        f.write('keychat = 32\n')
        f.write('keyconsole = C7\n')
        f.close()

        return Command.Command(array=commandArray)
