################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 23, 2023
DOOMRETRO_VERSION = d3688a4eab5d5f482dad0987e401f8aabd5170dd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
