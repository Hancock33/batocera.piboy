################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 26, 2025
DOOMRETRO_VERSION = 04115dcb1758fdf734e359c4bc1362e2903352f3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
