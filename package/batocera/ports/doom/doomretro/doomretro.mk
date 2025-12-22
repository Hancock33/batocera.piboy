################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 22, 2025
DOOMRETRO_VERSION = 42f9b762c0013d633c7a915238e98c220aa6a01b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
