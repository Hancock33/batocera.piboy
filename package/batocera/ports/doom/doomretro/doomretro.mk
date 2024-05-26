################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 26, 2024
DOOMRETRO_VERSION = 88efa576c6cd5b8c656bfccd87b1fa3eb5df06a8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
