#!/usr/bin/env python

import Command
import recalboxFiles
from generators.Generator import Generator
import shutil
import os
from settings.unixSettings import UnixSettings

class CitraGenerator(Generator):

    # Main entry of the module
    def generate(self, system, rom, playersControllers, gameResolution):
        CitraGenerator.writeCITRAConfig(recalboxFiles.citraConfig, system, playersControllers)

        commandArray = [recalboxFiles.recalboxBins[system.config['emulator']], "-f", rom]
        return Command.Command(array=commandArray, env={"XDG_CONFIG_HOME":recalboxFiles.CONF, "XDG_DATA_HOME":recalboxFiles.SAVES, "XDG_CACHE_HOME":recalboxFiles.CACHE})

    @staticmethod
    def writeCITRAConfig(citraConfigFile, system, playersControllers):
        citraConfig = dict()

        # pads
        citraButtons = {
            "button_a":      "a",
            "button_b":      "b",
            "button_x":      "x",
            "button_y":      "y",
            "button_up":     "up",
            "button_down":   "down",
            "button_left":   "left",
            "button_right":  "right",
            "button_l":      "pageup",
            "button_r":      "pagedown",
            "button_start":  "start",
            "button_select": "select",
            "button_zl":     "l2",
            "button_zr":     "r2",
            "button_home":   "hotkey"
        }

        citraAxis = {
            "circle_pad":    "joystick1",
            "c_stick":       "joystick2"
        }

        for index in playersControllers :
            controller = playersControllers[index]
            # we only care about player 1
            if controller.player != "1":
                continue
            for x in citraButtons:
                citraConfig[x] = CitraGenerator.setButton(citraButtons[x], controller.guid, controller.inputs)
            for x in citraAxis:
                citraConfig[x] = CitraGenerator.setAxis(citraAxis[x], controller.guid, controller.inputs)
            break

        ### update the configuration file
        CitraGenerator.writeCITRAConfigDefault(citraConfigFile)
        citraSettings = UnixSettings(citraConfigFile)
        for setting in citraConfig:
            citraSettings.save(setting, citraConfig[setting])

    @staticmethod
    def writeCITRAConfigDefault(citraConfigFile):
        if not os.path.exists(citraConfigFile):
            if not os.path.exists(os.path.dirname(citraConfigFile)):
                os.makedirs(os.path.dirname(citraConfigFile))
            # write default values template, so that the rest of the config can set values
            f = open(citraConfigFile, "w")
            f.write("""
[Controls]
# The input devices and parameters for each 3DS native input
# It should be in the format of "engine:[engine_name],[param1]:[value1],[param2]:[value2]..."
# Escape characters $0 (for ':'), $1 (for ',') and $2 (for '$') can be used in values

# for button input, the following devices are available:
#  - "keyboard" (default) for keyboard input. Required parameters:
#      - "code": the code of the key to bind
#  - "sdl" for joystick input using SDL. Required parameters:
#      - "joystick": the index of the joystick to bind
#      - "button"(optional): the index of the button to bind
#      - "hat"(optional): the index of the hat to bind as direction buttons
#      - "axis"(optional): the index of the axis to bind
#      - "direction"(only used for hat): the direction name of the hat to bind. Can be "up", "down", "left" or "right"
#      - "threshold"(only used for axis): a float value in (-1.0, 1.0) which the button is
#          triggered if the axis value crosses
#      - "direction"(only used for axis): "+" means the button is triggered when the axis value
#          is greater than the threshold; "-" means the button is triggered when the axis value
#          is smaller than the threshold
button_a=
button_b=
button_x=
button_y=
button_up=
button_down=
button_left=
button_right=
button_l=
button_r=
button_start=
button_select=
button_zl=
button_zr=
button_home=

# for analog input, the following devices are available:
#  - "analog_from_button" (default) for emulating analog input from direction buttons. Required parameters:
#      - "up", "down", "left", "right": sub-devices for each direction.
#          Should be in the format as a button input devices using escape characters, for example, "engine$0keyboard$1code$00"
#      - "modifier": sub-devices as a modifier.
#      - "modifier_scale": a float number representing the applied modifier scale to the analog input.
#          Must be in range of 0.0-1.0. Defaults to 0.5
#  - "sdl" for joystick input using SDL. Required parameters:
#      - "joystick": the index of the joystick to bind
#      - "axis_x": the index of the axis to bind as x-axis (default to 0)
#      - "axis_y": the index of the axis to bind as y-axis (default to 1)
circle_pad=
c_stick=

# for motion input, the following devices are available:
#  - "motion_emu" (default) for emulating motion input from mouse input. Required parameters:
#      - "update_period": update period in milliseconds (default to 100)
#      - "sensitivity": the coefficient converting mouse movement to tilting angle (default to 0.01)
#      - "tilt_clamp": the max value of the tilt angle in degrees (default to 90)
#  - "cemuhookudp" reads motion input from a udp server that uses cemuhook's udp protocol
motion_device=

# for touch input, the following devices are available:
#  - "emu_window" (default) for emulating touch input from mouse input to the emulation window. No parameters required
#  - "cemuhookudp" reads touch input from a udp server that uses cemuhook's udp protocol
#      - "min_x", "min_y", "max_x", "max_y": defines the udp device's touch screen coordinate system
touch_device=

# Most desktop operating systems do not expose a way to poll the motion state of the controllers
# so as a way around it, cemuhook created a udp client/server protocol to broadcast the data directly
# from a controller device to the client program. Citra has a client that can connect and read
# from any cemuhook compatible motion program.

# IPv4 address of the udp input server (Default "127.0.0.1")
udp_input_address = 127.0.0.1

# Port of the udp input server. (Default 26760)
udp_input_port = 26760

# The pad to request data on. Should be between 0 (Pad 1) and 3 (Pad 4). (Default 0)
udp_pad_index = 0

[Core]
# Whether to use the Just-In-Time (JIT) compiler for CPU emulation
# 0: Interpreter (slow), 1 (default): JIT (fast)
use_cpu_jit = 1

[Renderer]
# Whether to use software or hardware rendering.
# 0: Software, 1 (default): Hardware
use_hw_renderer = 1

# Whether to use hardware shaders to emulate 3DS shaders
# 0: Software, 1 (default): Hardware
use_hw_shader = 1

# Whether to use accurate multiplication in hardware shaders
# 0: Off (Default. Faster, but causes issues in some games) 1: On (Slower, but correct)
shaders_accurate_mul = 0

# Whether to fallback to software for geometry shaders
# 0: Off (Faster, but causes issues in some games) 1: On (Default. Slower, but correct)
shaders_accurate_gs = 1

# Whether to use the Just-In-Time (JIT) compiler for shader emulation
# 0: Interpreter (slow), 1 (default): JIT (fast)
use_shader_jit = 1

# Resolution scale factor
# 0: Auto (scales resolution to window size), 1: Native 3DS screen resolution, Otherwise a scale
# factor for the 3DS resolution
resolution_factor = 0

# Whether to enable V-Sync (caps the framerate at 60FPS) or not.
# 0 (default): Off, 1: On
use_vsync = 0

# Turns on the frame limiter, which will limit frames output to the target game speed
# 0: Off, 1: On (default)
use_frame_limit = 

# Limits the speed of the game to run no faster than this value as a percentage of target speed
# 1 - 9999: Speed limit as a percentage of target game speed. 100 (default)
frame_limit =

# The clear color for the renderer. What shows up on the sides of the bottom screen.
# Must be in range of 0.0-1.0. Defaults to 0.0 for all.
bg_red = 0
bg_blue = 0
bg_green = 0

# Toggles Stereoscopic 3D
# 0 (default): Off, 1: On
toggle_3d = 0

# Change 3D Intensity
# 0 - 100: Intensity. 0 (default)
factor_3d = 0

[Layout]
# Layout for the screen inside the render window.
# 0 (default): Default Top Bottom Screen, 1: Single Screen Only, 2: Large Screen Small Screen, 3: Side by Side
layout_option = 0

# Toggle custom layout (using the settings below) on or off.
# 0 (default): Off, 1: On
custom_layout = 1

# Screen placement when using Custom layout option
# 0x, 0y is the top left corner of the render window.
custom_top_left =
custom_top_top =
custom_top_right =
custom_top_bottom =
custom_bottom_left =
custom_bottom_top =
custom_bottom_right =
custom_bottom_bottom =

# Swaps the prominent screen with the other screen.
# For example, if Single Screen is chosen, setting this to 1 will display the bottom screen instead of the top screen.
# 0 (default): Top Screen is prominent, 1: Bottom Screen is prominent
swap_screen = 0

[Audio]
# Which audio output engine to use.
# auto (default): Auto-select, null: No audio output, sdl2: SDL2 (if available)
output_engine = auto

# Whether or not to enable the audio-stretching post-processing effect.
# This effect adjusts audio speed to match emulation speed and helps prevent audio stutter,
# at the cost of increasing audio latency.
# 0: No, 1 (default): Yes
enable_audio_stretching = 1

# Which audio device to use.
# auto (default): Auto-select
output_device = auto

# Output volume.
# 1.0 (default): 100%, 0.0; mute
volume = 1.0

[Data Storage]
# Whether to create a virtual SD card.
# 1 (default): Yes, 0: No
use_virtual_sd = 1

[System]
# The system model that Citra will try to emulate
# 0: Old 3DS (default), 1: New 3DS
is_new_3ds = 0

# The system region that Citra will use during emulation
# -1: Auto-select (default), 0: Japan, 1: USA, 2: Europe, 3: Australia, 4: China, 5: Korea, 6: Taiwan
region_value = -1

# The clock to use when citra starts
# 0: System clock (default), 1: fixed time
init_clock = 0

# Time used when init_clock is set to fixed_time in the format %Y-%m-%d %H:%M:%S
# set to fixed time. Default 2000-01-01 00:00:01
# Note: 3DS can only handle times later then Jan 1 2000
init_time =

[Camera]
# Which camera engine to use for the right outer camera
# blank (default): a dummy camera that always returns black image
camera_outer_right_name =

# A config string for the right outer camera. Its meaning is defined by the camera engine
camera_outer_right_config =

# The image flip to apply
# 0: None (default), 1: Horizontal, 2: Vertical, 3: Reverse
camera_outer_right_flip = 0

# ... for the left outer camera
camera_outer_left_name =
camera_outer_left_config =
camera_outer_left_flip =

# ... for the inner camera
camera_inner_name =
camera_inner_config =
camera_inner_flip =

[Miscellaneous]
# A filter which removes logs below a certain logging level.
# Examples: *:Debug Kernel.SVC:Trace Service.*:Critical
log_filter = *:Info

[Debugging]
# Port for listening to GDB connections.
use_gdbstub=false
gdbstub_port=24689
# To LLE a service module add "LLE\<module name>=true"

[WebService]
# Whether or not to enable telemetry
# 0: No, 1 (default): Yes
enable_telemetry = 0
# URL for Web API
web_api_url = https://api.citra-emu.org
# Username and token for Citra Web Service
# See https://services.citra-emu.org/ for more info
citra_username =
citra_token =
""")
            f.close()

    @staticmethod
    def setButton(key, padGuid, padInputs):
        # it would be better to pass the joystick num instead of the guid because 2 joysticks may have the same guid
        if key in padInputs:
            input = padInputs[key]

            if input.type == "button":
                return ("engine:sdl,guid:{},button:{}").format(padGuid, input.id)
            elif input.type == "hat":
                return ("engine:sdl,guid:{},hat:{},direction:{}").format(padGuid, input.id, CitraGenerator.hatdirectionvalue(input.value))
            elif input.type == "axis":
                # untested, need to configure an axis as button / triggers buttons to be tested too
                return ("engine:sdl,guid:{},axis:{},direction:{},threshold:{}").format(padGuid, input.id, "+", 0.5)

    @staticmethod
    def setAxis(key, padGuid, padInputs):
        inputx = -1
        inputy = -1

        if key == "joystick1":
            inputx = padInputs["joystick1left"]
        elif key == "joystick2":
            inputx = padInputs["joystick2left"]

        if key == "joystick1":
            inputy = padInputs["joystick1up"]
        elif key == "joystick2":
            inputy = padInputs["joystick2up"]

        return ("engine:sdl,guid:{},axis_x:{},axis_y:{}").format(padGuid, inputx.id, inputy.id)

    @staticmethod
    def hatdirectionvalue(value):
        if int(value) == 1:
            return "up"
        if int(value) == 4:
            return "down"
        if int(value) == 2:
            return "right"
        if int(value) == 8:
            return "left"
        return "unknown"
