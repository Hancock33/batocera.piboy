################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 16, 2025
DOOMRETRO_VERSION = bf1152b1b5b688b89a2d42a5cf04ec7ad03a6f71
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
