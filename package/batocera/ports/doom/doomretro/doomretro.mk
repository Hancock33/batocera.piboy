################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 24, 2025
DOOMRETRO_VERSION = 9b648b6a5b487768bef0d3f68fa9efac2fc2cbe0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
