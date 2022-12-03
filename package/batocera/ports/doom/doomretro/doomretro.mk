################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 03, 2022
DOOMRETRO_VERSION = f0a4ad28aa7c2816227aaf7c16d055f825360f64
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
