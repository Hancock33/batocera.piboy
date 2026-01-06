################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 06, 2026
DOOMRETRO_VERSION = 3e6968f634859c562513a9a01a46b5c529c6abc0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
