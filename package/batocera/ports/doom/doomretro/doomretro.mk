################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 09, 2025
DOOMRETRO_VERSION = 5d521114caead5d7857fbb1d53fecf9436d4378a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
