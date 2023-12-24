################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 24, 2023
DOOMRETRO_VERSION = 839e45f01e6eb04de06c925cba99fcc85c83bdc1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
