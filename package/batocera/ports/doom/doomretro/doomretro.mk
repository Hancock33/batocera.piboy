################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 09, 2025
DOOMRETRO_VERSION = e2fce1453029b72812b784a6b6c254a81df9aaaa
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
