################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 26, 2024
DOOMRETRO_VERSION = 61ee73a117785f2037a542ee7f4ee4b0e79b1d9f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
