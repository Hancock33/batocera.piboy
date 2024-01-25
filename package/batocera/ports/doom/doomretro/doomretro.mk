################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 25, 2024
DOOMRETRO_VERSION = 6d5d317cb0b1cc8cb5126e4907d880cdd0d7b582
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
