################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 03, 2024
DOOMRETRO_VERSION = 6fab0b1814db60a0726311b4804ea697180d2ae2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
