################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 06, 2024
DOOMRETRO_VERSION = 96d79396ba173e000969d89d3844e4a0598cf461
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
