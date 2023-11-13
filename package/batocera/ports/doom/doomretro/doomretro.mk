################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 13, 2023
DOOMRETRO_VERSION = 4ce5479aec80fc15a256f68fdf33031e519fb04f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
