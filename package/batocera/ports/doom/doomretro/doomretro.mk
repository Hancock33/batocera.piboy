################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 19, 2023
DOOMRETRO_VERSION = c49d22d7e4fcabf6f663f3cd7082f33b15c87538
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
