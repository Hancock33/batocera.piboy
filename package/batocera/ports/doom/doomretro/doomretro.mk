################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 01, 2024
DOOMRETRO_VERSION = 17b89f057e7812cecc8820e423df08df7d7d63a5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
