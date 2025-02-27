################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 27, 2025
DOOMRETRO_VERSION = 1a46ca8949b96b549dc808433a5c7a02719b1dba
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
