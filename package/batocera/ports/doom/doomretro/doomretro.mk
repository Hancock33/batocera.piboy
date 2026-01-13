################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 13, 2026
DOOMRETRO_VERSION = cb90cb49e8af5913748094399c3c1d178ef0dee2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
