################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 23, 2025
DOOMRETRO_VERSION = 27f90b318e59342ded56af77bfce75fcc676cfe9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
