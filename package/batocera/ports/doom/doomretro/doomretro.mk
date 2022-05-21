################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 21, 2022
DOOMRETRO_VERSION = de6b28cb9113ff71062abf6896823889daa629c0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
