################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 14, 2024
DOOMRETRO_VERSION = d041a18a013e6011a947712c7b1221ddeaa15898
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
