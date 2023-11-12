################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 12, 2023
DOOMRETRO_VERSION = afc29d8179897ebb7e4e4f3cfddc000f76187018
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
