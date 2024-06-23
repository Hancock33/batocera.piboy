################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 23, 2024
DOOMRETRO_VERSION = 60bb8115ff21337819ec7c445c2f5ec71a8d3227
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
