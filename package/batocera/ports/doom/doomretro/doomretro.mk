################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 23, 2024
DOOMRETRO_VERSION = 6772bdc30f85dbbca0f9754c7183de6f47d89553
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
