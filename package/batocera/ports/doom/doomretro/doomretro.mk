################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 13, 2025
DOOMRETRO_VERSION = 3fd665ece6ccb4880bfda2707b0095f37b46dc41
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
