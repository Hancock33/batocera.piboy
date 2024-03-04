################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 04, 2024
DOOMRETRO_VERSION = 02451d88ea46f9117c284ba611cf33d70197dc4a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
