################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 13, 2022
DOOMRETRO_VERSION = d116750c9b0c6266964fbff2498df107eab245e0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
