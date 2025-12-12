################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 12, 2025
DOOMRETRO_VERSION = 79f41f780d590ae5195b4c72157216240c926c9c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
