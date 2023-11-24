################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 24, 2023
DOOMRETRO_VERSION = b561d796b72772e44cf9ba74f307b8f496e51684
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
