################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 06, 2025
DOOMRETRO_VERSION = 7db49b7b020e4961e7b79b18d729607b2f45c8cc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
