################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 09, 2023
DOOMRETRO_VERSION = 2ccd12d98fb2def5010e6d3a81cf75cdf333e067
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
