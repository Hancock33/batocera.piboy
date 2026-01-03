################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 03, 2026
DOOMRETRO_VERSION = ee78162840941d7d7315804f9d2f40575eba62ea
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
