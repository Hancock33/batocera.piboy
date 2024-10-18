################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 18, 2024
DOOMRETRO_VERSION = 2d6dea1b6c3a3d3d13f599b6c3ffdbfcd49f7f8f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
