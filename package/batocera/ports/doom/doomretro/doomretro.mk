################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 11, 2022
DOOMRETRO_VERSION = 226cfbaa6b362d71d4d3822cf5bf74b75d18e1f4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
