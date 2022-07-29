################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 29, 2022
DOOMRETRO_VERSION = 73c1bf2cf0ba98c682f2334ac8d28481ad271906
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
