################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 17, 2025
DOOMRETRO_VERSION = 750e6068d4c8c81c1ab0f82eadee121c4878625b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
