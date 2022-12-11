################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 11, 2022
DOOMRETRO_VERSION = 6f31d68f1db75bec75258231e451b5c204a241cb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
