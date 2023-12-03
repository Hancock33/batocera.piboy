################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 03, 2023
DOOMRETRO_VERSION = e33a3891832488ae4aaba7c86297cf4a8cdf9bf1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
