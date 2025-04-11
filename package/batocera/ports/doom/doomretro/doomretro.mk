################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 11, 2025
DOOMRETRO_VERSION = d500356f6f5219f942c86e52441a2f250a21dd27
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
