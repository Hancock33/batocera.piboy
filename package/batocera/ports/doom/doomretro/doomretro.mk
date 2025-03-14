################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 14, 2025
DOOMRETRO_VERSION = 100d480b80691bbfabd15072721f75164ca4e8ec
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
