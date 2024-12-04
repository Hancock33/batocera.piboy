################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 04, 2024
DOOMRETRO_VERSION = e7dcb4aca54aebd752aee0d9dd5f185e42444d1a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
