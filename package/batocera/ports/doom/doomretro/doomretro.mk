################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 25, 2022
DOOMRETRO_VERSION = f222a77afbd5907dbe523312a2d5f59f60ce0f76
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
