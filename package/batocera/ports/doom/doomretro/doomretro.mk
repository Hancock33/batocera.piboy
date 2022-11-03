################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 03, 2022
DOOMRETRO_VERSION = 82c9b4503a89c26b7454d2d9a6ab1fa485e05b9d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
