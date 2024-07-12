################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 12, 2024
DOOMRETRO_VERSION = e66285bcf62b20beb4ab7c5f4eb6ad315b2f74c1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
