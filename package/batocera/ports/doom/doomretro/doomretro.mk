################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 13, 2024
DOOMRETRO_VERSION = 1ddfeb415baee28fef7733b8479c1eae607d5f4e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
