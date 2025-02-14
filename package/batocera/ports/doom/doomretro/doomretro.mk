################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 14, 2025
DOOMRETRO_VERSION = 0e570b4f0f6a671f4def229911069df3687b7a0a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
