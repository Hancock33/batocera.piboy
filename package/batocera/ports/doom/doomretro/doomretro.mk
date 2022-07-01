################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 01, 2022
DOOMRETRO_VERSION = 7dd3652a9d4fe5a59c2d4cd9161123e784ef43df
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
