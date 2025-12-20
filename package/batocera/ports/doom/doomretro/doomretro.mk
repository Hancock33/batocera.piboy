################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 20, 2025
DOOMRETRO_VERSION = 4f1cb007426289d606da49ab1d3c87c33aac2f95
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
