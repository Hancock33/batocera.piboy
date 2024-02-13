################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 13, 2024
DOOMRETRO_VERSION = 6b12fbc84cc0125ddbdad06239388d2ca3632f55
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
