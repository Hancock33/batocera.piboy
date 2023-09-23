################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 23, 2023
DOOMRETRO_VERSION = c86d5a17a451e66b3509bd6797c794bf81a42f48
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
