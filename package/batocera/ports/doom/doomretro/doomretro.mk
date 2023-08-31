################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 31, 2023
DOOMRETRO_VERSION = 3746ba252d8d9355a31942b8368d0dddc1edc647
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
