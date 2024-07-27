################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 27, 2024
DOOMRETRO_VERSION = d2809d77413fb8935d41570f1dccf161460ef8ae
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
