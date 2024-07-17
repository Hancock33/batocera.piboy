################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 17, 2024
DOOMRETRO_VERSION = 129591b06bc902ae5e0242727535401b6ee25041
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
