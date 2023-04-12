################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 12, 2023
DOOMRETRO_VERSION = 45120f736f2c144d7563018d9c0895dea6979607
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
