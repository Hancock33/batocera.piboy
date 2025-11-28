################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 28, 2025
DOOMRETRO_VERSION = 998be64cadc8146df4fa45af97cdfaeaaf16f59a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
