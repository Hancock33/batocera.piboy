################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 14, 2024
DOOMRETRO_VERSION = b1f7b68decb6f900fe4d4b9d9a7aed7aabfde652
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
