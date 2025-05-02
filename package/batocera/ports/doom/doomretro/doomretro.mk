################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 02, 2025
DOOMRETRO_VERSION = 0937f9e8c63e89123e572282b5f0cad093498099
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
