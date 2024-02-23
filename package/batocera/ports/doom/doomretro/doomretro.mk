################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 23, 2024
DOOMRETRO_VERSION = de1e9c594d162b9384e9b39e342447977bd849e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
