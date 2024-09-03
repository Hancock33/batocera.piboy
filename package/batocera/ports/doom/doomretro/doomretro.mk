################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 03, 2024
DOOMRETRO_VERSION = 8bad1d7bd28203af95f301c7e03efcbebb7f45cf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
