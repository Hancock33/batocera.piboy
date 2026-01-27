################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 27, 2026
DOOMRETRO_VERSION = 1acf99b3aa2d8bc086f6fe86f606d82ee13684b8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
