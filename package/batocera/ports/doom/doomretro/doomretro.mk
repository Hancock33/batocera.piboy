################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 01, 2023
DOOMRETRO_VERSION = 49d0f2b11c15a656879ad4d9442bbedba02a1e21
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
