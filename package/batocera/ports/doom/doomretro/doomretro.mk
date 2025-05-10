################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 10, 2025
DOOMRETRO_VERSION = fe96bc2e10384fc408b5d2d181e55c27bc776eeb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
