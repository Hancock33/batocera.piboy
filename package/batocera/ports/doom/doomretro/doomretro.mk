################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 09, 2023
DOOMRETRO_VERSION = b75024726a798b5d82f67fecfe341820894df1c7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
