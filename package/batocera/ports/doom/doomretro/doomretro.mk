################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 05, 2024
DOOMRETRO_VERSION = 359ce9d5a1b0480e5ff9b5ac08ed5ba281551640
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
