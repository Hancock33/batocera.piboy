################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 17, 2022
DOOMRETRO_VERSION = ac539d6a2574fc93c6a55282d4a8902df6d9119b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
