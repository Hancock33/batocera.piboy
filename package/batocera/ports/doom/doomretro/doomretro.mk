################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 03, 2022
DOOMRETRO_VERSION = eec5b408b5351720a474e5447689b1d28147a3c5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
