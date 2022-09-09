################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 09, 2022
DOOMRETRO_VERSION = 4e9dc4f67a022b380a1b98e4d7e65b0115862340
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
