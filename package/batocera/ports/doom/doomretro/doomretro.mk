################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 05, 2025
DOOMRETRO_VERSION = 7118aba4518c33e994dec6b700cbc743dbd5da7b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
