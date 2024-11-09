################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 09, 2024
DOOMRETRO_VERSION = 3c5e6cd2d88352eab7a4f0e9ecb92e398564873f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
