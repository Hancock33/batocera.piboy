################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 29, 2025
DOOMRETRO_VERSION = 57984b41a0e4cdac76e1da5f3f523923c8eeb100
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
