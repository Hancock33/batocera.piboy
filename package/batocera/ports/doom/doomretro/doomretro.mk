################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 23, 2024
DOOMRETRO_VERSION = 4698c9f7be1136f6b56ee8e3f3951624291718e7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
