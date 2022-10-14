################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 14, 2022
DOOMRETRO_VERSION = 1d46c4141d4b80778ad693783e0fd520c5b73280
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
