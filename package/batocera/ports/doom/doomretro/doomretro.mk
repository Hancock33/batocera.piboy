################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 15, 2023
DOOMRETRO_VERSION = 8707c6d8e64fecb7f15d98bffdf505f7333e8354
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
