################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 11, 2025
DOOMRETRO_VERSION = 2ac8083709b1eecec5a2bc1a643649aa95ee65bc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
