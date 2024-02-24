################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 24, 2024
DOOMRETRO_VERSION = b79a0a2f8e77e74ccf22422d8bcdbe5e70f49cf5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
