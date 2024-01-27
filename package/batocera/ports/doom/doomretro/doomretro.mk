################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 27, 2024
DOOMRETRO_VERSION = 8081e78db2e8ea3d548539b855df7c533c65888c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
