################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 09, 2024
DOOMRETRO_VERSION = 29d1772f085a537086e4e714f04fc29f950d8e12
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
