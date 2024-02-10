################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 10, 2024
DOOMRETRO_VERSION = 6ae86c3e208967b1b756736728b43c40b96310e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
