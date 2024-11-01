################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 01, 2024
DOOMRETRO_VERSION = 3fa00eb4e7f92e5d231711030590aa2b9806d7d9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
