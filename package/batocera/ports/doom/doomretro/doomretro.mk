################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 16, 2024
DOOMRETRO_VERSION = 9244989d67de41184378121cd57a4a0a1bb506c6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
