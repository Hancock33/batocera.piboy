################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 28, 2023
DOOMRETRO_VERSION = 7b1bfb333b37e496d30872f7de276e102e9104a6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
