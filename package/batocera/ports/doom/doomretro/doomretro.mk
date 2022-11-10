################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 10, 2022
DOOMRETRO_VERSION = 3acb120f75d3a52369878141fc49185f881a52f7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
