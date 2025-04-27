################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 27, 2025
DOOMRETRO_VERSION = 990c2a023bbd6ae1f206d7ca202314ab7bbfb50e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
