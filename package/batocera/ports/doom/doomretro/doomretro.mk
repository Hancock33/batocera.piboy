################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 05, 2024
DOOMRETRO_VERSION = 2b4f7251b896575a8bef18ffcf83b27e804594d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
