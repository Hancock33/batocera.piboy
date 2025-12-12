################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 12, 2025
DOOMRETRO_VERSION = 56097ffa0f806e578e1e92b908f24d776b59b0a3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
