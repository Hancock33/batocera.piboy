################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 05, 2022
DOOMRETRO_VERSION = b7288da2896011ef4d85cb3d8e39b5f57fae15ca
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
