################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 15, 2024
DOOMRETRO_VERSION = 9a05b1b297cce0743e9c0ff3e438925d9c58a3de
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
