################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 22, 2025
DOOMRETRO_VERSION = e07ccd4e4e6f8614972e2a2d6adb9e7aa6152f61
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
