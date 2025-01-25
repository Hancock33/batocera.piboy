################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 25, 2025
DOOMRETRO_VERSION = d51f62332e5264cc9cd1e61b0e4a54a1aa955945
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
