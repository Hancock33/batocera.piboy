################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 30, 2025
DOOMRETRO_VERSION = be71f495e9176c1e9d82294a23d0fd4f1f1c7d95
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
