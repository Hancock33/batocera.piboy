################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 18, 2024
DOOMRETRO_VERSION = a91604b447b695c32378050128f0f88c85cb4c1a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
