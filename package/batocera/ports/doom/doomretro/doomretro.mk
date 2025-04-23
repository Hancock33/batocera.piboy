################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 23, 2025
DOOMRETRO_VERSION = 4862d4662abce1cbfe060bde7dc8cd42854dc137
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
