################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 09, 2022
DOOMRETRO_VERSION = bbcde7c7841b907710633502a5368e4db3fe98de
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
