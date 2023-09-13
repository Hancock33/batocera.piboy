################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 13, 2023
DOOMRETRO_VERSION = 9c1e7b4c14511e9cc26c868c270408d9a2b0fbf6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
