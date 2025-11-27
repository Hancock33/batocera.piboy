################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 27, 2025
DOOMRETRO_VERSION = bad6164b4e3889e13be3107f798e4566ba565644
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
