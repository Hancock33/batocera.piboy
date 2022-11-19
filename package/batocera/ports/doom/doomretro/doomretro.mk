################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 19, 2022
DOOMRETRO_VERSION = 1a27347ce2dedb9869bfceb3e1197207863aae62
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
