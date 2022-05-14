################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 14, 2022
DOOMRETRO_VERSION = 3ddcde71d8fbb8befd4c5d1ed4685f237cefbd03
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
