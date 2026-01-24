################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 24, 2026
DOOMRETRO_VERSION = 8ef2c5d46ccf8b49feae0a0ef673955dbc5d6ab5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
