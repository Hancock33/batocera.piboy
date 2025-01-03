################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 03, 2025
DOOMRETRO_VERSION = 0ef14642dd47b0c94acb672dd9d2dbacd4b43f0e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
