################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 02, 2024
DOOMRETRO_VERSION = 35408a4ac96812eab2e7df3f8620e11508512ba3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
