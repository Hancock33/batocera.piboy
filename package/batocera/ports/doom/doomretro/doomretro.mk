################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 25, 2025
DOOMRETRO_VERSION = a31201d4dd9c1a001d249d81976c97d31e159cd1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
