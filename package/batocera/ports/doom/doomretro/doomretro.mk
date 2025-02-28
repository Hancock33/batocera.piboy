################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 28, 2025
DOOMRETRO_VERSION = 3755011f9bb72b6ad6cdff8b1bbdbe7203edbccb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
