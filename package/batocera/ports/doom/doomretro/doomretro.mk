################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 08, 2024
DOOMRETRO_VERSION = 3f6c69e2b718dfd75de944be199165e438368d16
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
