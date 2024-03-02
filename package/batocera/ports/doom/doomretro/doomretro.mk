################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 02, 2024
DOOMRETRO_VERSION = 2aa6af5359f9d86211c0f96c81193212c3afc24b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
