################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 07, 2026
DOOMRETRO_VERSION = cbac10515ab0228a35dd39eae0d23cbce0e445ba
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
