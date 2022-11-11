################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 11, 2022
DOOMRETRO_VERSION = 19d47cda310821da869e20794b52b59fddd6576a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
