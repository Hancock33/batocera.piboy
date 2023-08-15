################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 15, 2023
DOOMRETRO_VERSION = 7ac8a02f03d3fd92e351b3c4c7a67bf6b371da71
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
