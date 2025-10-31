################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 31, 2025
DOOMRETRO_VERSION = 21a22f54faa2b912f32e9dc91176350dd5ab6eab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
