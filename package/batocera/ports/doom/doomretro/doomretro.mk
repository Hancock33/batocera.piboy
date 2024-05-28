################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 28, 2024
DOOMRETRO_VERSION = 002e0172dd8339ecc9e8706ebfb897fcea0df96a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
