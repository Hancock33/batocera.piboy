################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 23, 2025
DOOMRETRO_VERSION = 282a0178fd31fc1e8bb9737fd7f71d893f028ce2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
