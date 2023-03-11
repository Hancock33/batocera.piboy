################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 11, 2023
DOOMRETRO_VERSION = 7c5cdab9a4d68416dfbdf29fa4a8534e04d4b1dd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
