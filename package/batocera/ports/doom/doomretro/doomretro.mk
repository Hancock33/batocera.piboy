################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 29, 2025
DOOMRETRO_VERSION = 473b0de0907740c841f0a3112b329060ec650494
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
