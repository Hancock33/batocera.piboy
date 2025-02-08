################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 08, 2025
DOOMRETRO_VERSION = 5090d5339ca461cc5c6f42853bf0ed5284174274
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
