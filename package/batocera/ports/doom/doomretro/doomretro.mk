################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 15, 2025
DOOMRETRO_VERSION = 3c8bd0bd2c32d883f5c5b4415e464b7e35b9d063
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
