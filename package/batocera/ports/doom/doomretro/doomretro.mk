################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 15, 2025
DOOMRETRO_VERSION = 5c5347a8d0dc7e69dbbec80aa4f4e4f101d88d2a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
