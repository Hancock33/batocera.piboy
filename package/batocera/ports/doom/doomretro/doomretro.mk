################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 22, 2025
DOOMRETRO_VERSION = 3d457a2af411c88acdc131d0665529c9fbddf8d8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
