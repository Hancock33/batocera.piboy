################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 19, 2022
DOOMRETRO_VERSION = 33563eb0c076bbe2847520ee0462c448c5b6065c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
