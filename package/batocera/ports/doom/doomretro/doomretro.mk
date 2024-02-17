################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 17, 2024
DOOMRETRO_VERSION = 6b8407be2c4963a3b42614a1dbcbd15bd2bd2dd1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
