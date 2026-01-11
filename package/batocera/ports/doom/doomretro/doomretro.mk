################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 11, 2026
DOOMRETRO_VERSION = c2edac1cfd0a1c6c9810589bfbe080a82ac4d5c8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
