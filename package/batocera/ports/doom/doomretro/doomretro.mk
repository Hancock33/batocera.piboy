################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 21, 2024
DOOMRETRO_VERSION = 9dd5ae150d2af6d43c5c5a8c423cf7f5e974f98c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
