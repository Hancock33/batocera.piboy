################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 05, 2022
DOOMRETRO_VERSION = bd1e960ed2f0e5d50f9995b069662bc2876f24ab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
