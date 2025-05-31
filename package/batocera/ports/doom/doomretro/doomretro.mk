################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 30, 2025
DOOMRETRO_VERSION = be2f507b2a611d0bc6646e33d4d03c85ab0ea024
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
