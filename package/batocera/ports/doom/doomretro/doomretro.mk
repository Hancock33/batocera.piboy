################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 10, 2024
DOOMRETRO_VERSION = f1c0f5215ab2290814c9b4f73ff5d90864e05bcf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
