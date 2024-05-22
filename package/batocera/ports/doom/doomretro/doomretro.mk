################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 22, 2024
DOOMRETRO_VERSION = 7f8c2a349853fe8bb4a2684372a46e18a9b06af4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
