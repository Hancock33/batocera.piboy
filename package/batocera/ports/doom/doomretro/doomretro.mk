################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 26, 2024
DOOMRETRO_VERSION = d931833821684a993dd8c5ff6e00686652837135
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
