################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 01, 2025
DOOMRETRO_VERSION = d7d2439162ed7196b587e69d0acdef43f8a1e61d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
