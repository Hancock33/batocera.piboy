################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 09, 2025
DOOMRETRO_VERSION = 8e64f77c79324d8ce2c5b607db8ad5ca7af9ba63
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
