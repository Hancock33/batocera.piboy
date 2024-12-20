################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 20, 2024
DOOMRETRO_VERSION = 63f3fef2a2239377b902616a7a23df91ed248d1b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
