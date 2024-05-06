################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 06, 2024
DOOMRETRO_VERSION = 7463f0fa4930a0dea8c973c9ed9f341d272b99d8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
