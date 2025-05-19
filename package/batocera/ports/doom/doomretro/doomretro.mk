################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 19, 2025
DOOMRETRO_VERSION = 03d72623900d618274fafc4ed280e16d519adc70
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
