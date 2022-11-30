################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 30, 2022
DOOMRETRO_VERSION = 3cec839d3c6427582fca4ede529a53b88af44848
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
