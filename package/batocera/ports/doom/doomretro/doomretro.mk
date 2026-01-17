################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 17, 2026
DOOMRETRO_VERSION = 237849c3d0e46e5f528f9762f42041ceb6abaf69
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
