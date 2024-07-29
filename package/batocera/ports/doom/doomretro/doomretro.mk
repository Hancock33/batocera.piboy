################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 29, 2024
DOOMRETRO_VERSION = a274ee7c9461ba5054eabc186fec8e6762a92362
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
