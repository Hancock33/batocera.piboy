################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 05, 2024
DOOMRETRO_VERSION = dd77d4d9dd3b95d5c31d9364d345273b98538a5f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
