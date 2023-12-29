################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 29, 2023
DOOMRETRO_VERSION = 2d59a40cc5ecd92dbabf953cd1e92f417e0d8411
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
