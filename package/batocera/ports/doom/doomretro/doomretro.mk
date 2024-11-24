################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 23, 2024
DOOMRETRO_VERSION = 87b1797b20b67520df4d1ab5d27a0d36e433ab0e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
