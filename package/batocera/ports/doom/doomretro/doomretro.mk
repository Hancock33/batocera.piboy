################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 15, 2024
DOOMRETRO_VERSION = 3d366070bd6a9210a8e888c45246b4e4fc05a554
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
