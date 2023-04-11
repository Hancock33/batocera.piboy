################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 11, 2023
DOOMRETRO_VERSION = 1e5d0bc3ccc226365edf66214e2471e1117ab1b1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
