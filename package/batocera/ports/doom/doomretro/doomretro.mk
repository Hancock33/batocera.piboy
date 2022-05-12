################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 12, 2022
DOOMRETRO_VERSION = 83030bc8f8147a238d316025e10df83ca627c467
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
