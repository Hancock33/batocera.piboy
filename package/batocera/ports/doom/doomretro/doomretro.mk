################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 23, 2023
DOOMRETRO_VERSION = 123a0f7274cc5b27632ca17c6e68c2708704cdcc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
