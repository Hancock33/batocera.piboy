################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 23, 2025
DOOMRETRO_VERSION = 71b1bdb65a1ee271df73e3016c682a9e789de228
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
