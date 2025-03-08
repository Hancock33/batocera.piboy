################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 08, 2025
DOOMRETRO_VERSION = 46b9d9b8789781cf3438206a87fb59bebaabfe10
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
