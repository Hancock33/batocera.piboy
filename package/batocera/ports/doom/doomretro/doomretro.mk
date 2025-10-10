################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 10, 2025
DOOMRETRO_VERSION = fc4546f696b2a3d0c3f58a4570c0351547912c7c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
