################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 04, 2025
DOOMRETRO_VERSION = eeb5dedf4fe9c851482593eb3cece64ab7ce0b47
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
