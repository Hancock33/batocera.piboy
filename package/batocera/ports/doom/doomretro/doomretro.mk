################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 21, 2024
DOOMRETRO_VERSION = 24544bd5844b4742d477f2d7aba9ce444c4ab2af
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
