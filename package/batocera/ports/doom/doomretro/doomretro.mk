################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 10, 2022
DOOMRETRO_VERSION = 1b06faba7014d301c0e67c7190486fb642a6d26f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
