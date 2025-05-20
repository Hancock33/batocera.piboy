################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 20, 2025
DOOMRETRO_VERSION = 82ce402e25f4168f5eeae416c685a16fbd858363
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
