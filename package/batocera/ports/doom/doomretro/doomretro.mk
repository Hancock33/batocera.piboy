################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 10, 2024
DOOMRETRO_VERSION = 53b619d0370d6cfd15fb89eb89f183b4df0a6771
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
