################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 06, 2025
DOOMRETRO_VERSION = ba5f6cb65ace28064db0303bef36f6ea670fabbc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
