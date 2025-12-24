################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 24, 2025
DOOMRETRO_VERSION = 5e0fe9efbb77063c4bc7742b5bfc8a5f069e6d10
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
