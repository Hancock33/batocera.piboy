################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 12, 2022
DOOMRETRO_VERSION = a0cc10451ae2bf124e91c9520546e20535b75391
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
