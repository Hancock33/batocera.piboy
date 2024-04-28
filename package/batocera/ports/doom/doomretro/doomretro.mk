################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 28, 2024
DOOMRETRO_VERSION = 21a2d3fa7fadf38bf4630188608631ddaf2c9a9c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
