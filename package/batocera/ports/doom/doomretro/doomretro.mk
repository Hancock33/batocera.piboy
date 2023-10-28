################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 28, 2023
DOOMRETRO_VERSION = 9918ef075e81081f628d555e622fb959b16fff3d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
