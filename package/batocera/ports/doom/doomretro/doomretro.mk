################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 03, 2025
DOOMRETRO_VERSION = 2726e79d699a1e7a5a206e23608258006988f6af
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
