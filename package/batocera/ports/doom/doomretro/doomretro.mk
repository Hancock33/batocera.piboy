################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 24, 2023
DOOMRETRO_VERSION = ef9a4d151c28a1d4459585164a88353a87e00cc1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
