################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 02, 2024
DOOMRETRO_VERSION = 3e3be99ded2de9eb205611d82939c1ddda6bd205
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
