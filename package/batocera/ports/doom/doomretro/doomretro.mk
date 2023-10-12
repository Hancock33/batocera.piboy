################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 12, 2023
DOOMRETRO_VERSION = bf46561d8a6d60c5a8addff8317b77b7fd9ff968
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
