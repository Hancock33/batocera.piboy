################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 06, 2022
DOOMRETRO_VERSION = ada48522d825df47b099554ab2e2dc1d9dd788c0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
