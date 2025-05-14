################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 14, 2025
DOOMRETRO_VERSION = b784120654a06265e532980e44b00a8d3ed9efa6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
