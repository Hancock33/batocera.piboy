################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 30, 2024
DOOMRETRO_VERSION = b4b3227385edde7ce8b86c809f296fd3005a3f0c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
