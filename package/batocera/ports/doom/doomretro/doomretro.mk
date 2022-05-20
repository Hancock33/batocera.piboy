################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 20, 2022
DOOMRETRO_VERSION = aa5c726437c72631e93947e4c92160094f2b5de4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
