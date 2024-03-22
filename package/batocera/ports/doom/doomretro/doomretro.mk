################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 22, 2024
DOOMRETRO_VERSION = b3880aaff2309b0511b19655e4e0ce2d5775c19b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
