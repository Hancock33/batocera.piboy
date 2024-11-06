################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 06, 2024
DOOMRETRO_VERSION = 1aa820256443a012f1245fede9f04c301b6c5e20
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
