################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 07, 2024
DOOMRETRO_VERSION = 6cc2234912276bec26969b3a157f3e7d4c4698b5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
