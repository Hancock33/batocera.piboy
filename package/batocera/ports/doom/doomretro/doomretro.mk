################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 26, 2024
DOOMRETRO_VERSION = 5c15ef3d47db7129c6cece284e189732356cb9a7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
