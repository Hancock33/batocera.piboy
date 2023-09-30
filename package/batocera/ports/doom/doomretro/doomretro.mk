################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 30, 2023
DOOMRETRO_VERSION = ae567ab5c543e0cfc6f7f256aedbe04773622faf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
