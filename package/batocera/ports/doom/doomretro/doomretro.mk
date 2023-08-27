################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 27, 2023
DOOMRETRO_VERSION = 82d43d863b065f8405bbd04e4903a59fdeee71cf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
