################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 16, 2024
DOOMRETRO_VERSION = 7bd113de209423c48d0141b47ae18ea189e2368d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
