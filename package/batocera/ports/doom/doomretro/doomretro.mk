################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 13, 2024
DOOMRETRO_VERSION = 544dc39151cb7e206e357ea2987a8a1850c2de20
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
