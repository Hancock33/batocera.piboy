################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 28, 2024
DOOMRETRO_VERSION = ee76ea9f3322058b99de023316262f33b7e00fb4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
