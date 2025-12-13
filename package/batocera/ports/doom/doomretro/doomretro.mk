################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 13, 2025
DOOMRETRO_VERSION = b53e37403661da45e16432adbf5dfc194c9b737a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
