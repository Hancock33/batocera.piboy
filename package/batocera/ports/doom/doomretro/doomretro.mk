################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 13, 2023
DOOMRETRO_VERSION = 1b2042768bd3756e09f180102d8b5cc1949183c6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
