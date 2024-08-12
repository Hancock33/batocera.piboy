################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 12, 2024
DOOMRETRO_VERSION = 88459b8a7d400735a076e4701fe900551e20cde3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
