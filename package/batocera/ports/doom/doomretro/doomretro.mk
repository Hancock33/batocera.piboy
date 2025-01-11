################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 11, 2025
DOOMRETRO_VERSION = a33b7d9c15190fe48f16d3fa8df167f081b5be1f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
