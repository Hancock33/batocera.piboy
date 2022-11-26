################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 26, 2022
DOOMRETRO_VERSION = 86162b2a74221a6610c0855d14fa56b0112d333a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
