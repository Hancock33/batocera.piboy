################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 30, 2025
DOOMRETRO_VERSION = f15185f6e3b687aa20da9a01d2aa0fd9435665da
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
