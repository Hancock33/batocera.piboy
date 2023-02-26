################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 26, 2023
DOOMRETRO_VERSION = 56f4bbe15ba611f1e164610f948613f3769c1a32
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
