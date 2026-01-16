################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 16, 2026
DOOMRETRO_VERSION = bf1cf6e4d0ec9ef5f15634b42b0fb090c45d39d8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
