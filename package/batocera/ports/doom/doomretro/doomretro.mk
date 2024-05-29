################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 29, 2024
DOOMRETRO_VERSION = 1ee1b7d7bb615a5d93b22bfde5b7df5a2c1872fa
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
