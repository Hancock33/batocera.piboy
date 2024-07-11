################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 11, 2024
DOOMRETRO_VERSION = 9c1532127477b2caef02a73a45d52cd5fd79808c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
