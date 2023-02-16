################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 16, 2023
DOOMRETRO_VERSION = b5b4568fbfa2b6d3ffb6dfdb0a88b1818dc474cb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
