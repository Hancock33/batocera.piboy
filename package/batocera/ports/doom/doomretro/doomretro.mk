################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 21, 2023
DOOMRETRO_VERSION = 2c7cf09835f11584abf28787d3244955a2686fa5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
