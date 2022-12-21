################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 21, 2022
DOOMRETRO_VERSION = 29a4878d2787b27fea4cf85ddd21182f57cebb12
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
