################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 01, 2024
DOOMRETRO_VERSION = 9acb7aa5c6747e1e69bc912ce3d523e2e9cb0035
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
