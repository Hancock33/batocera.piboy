################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 13, 2024
DOOMRETRO_VERSION = 8f59de4e9eb73c65d0f99fe900559e9a2450270c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
