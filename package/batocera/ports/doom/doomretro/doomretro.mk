################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 24, 2025
DOOMRETRO_VERSION = a89bae7c9c36fc4a52f02f66402c7975d4051b09
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
