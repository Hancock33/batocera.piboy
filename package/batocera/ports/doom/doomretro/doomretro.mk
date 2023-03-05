################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 05, 2023
DOOMRETRO_VERSION = 6cab27c654ffa48cacf629135accd20f74e38e37
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
