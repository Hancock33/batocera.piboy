################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 15, 2022
DOOMRETRO_VERSION = 5b42a5c1648aeb8719e83fc6f8d4204a8f87968d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
