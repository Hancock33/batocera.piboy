################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 08, 2024
DOOMRETRO_VERSION = e3015fe959fa4aa53c3d7cd5911fa371c90bec2b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
