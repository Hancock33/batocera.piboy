################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 11, 2023
DOOMRETRO_VERSION = e88004b02f2720b5f25f5a35a4a1cf4913b5be0e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
