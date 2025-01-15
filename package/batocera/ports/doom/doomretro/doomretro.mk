################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 15, 2025
DOOMRETRO_VERSION = 5b4d8a9ba1b20ff83173cdbcc20416174344de14
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
