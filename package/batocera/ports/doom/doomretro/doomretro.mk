################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 09, 2024
DOOMRETRO_VERSION = bbc1d94d1d716b7338e86382cbf44268a838c708
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
