################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 02, 2023
DOOMRETRO_VERSION = 9f797dc07f8c950452f0a2263b39c7a1ed878a43
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
