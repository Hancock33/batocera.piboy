################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 26, 2024
DOOMRETRO_VERSION = 422c84ae12bb6d68d1bc10d5486e376a9cb13041
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
