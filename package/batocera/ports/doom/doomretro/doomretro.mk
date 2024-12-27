################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 27, 2024
DOOMRETRO_VERSION = 3d4deeda107a578936a748ad68933a6f285fe8b4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
