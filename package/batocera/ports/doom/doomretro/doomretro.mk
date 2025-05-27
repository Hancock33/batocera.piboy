################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 26, 2025
DOOMRETRO_VERSION = e5b24cf5d8ec185e0e491ec70b243ea74b6d39e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
