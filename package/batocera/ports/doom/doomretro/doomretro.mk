################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 02, 2024
DOOMRETRO_VERSION = fd16372e129aed050e4d4cf083e11866cb1e0f19
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
