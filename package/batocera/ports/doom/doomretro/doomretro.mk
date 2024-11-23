################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 23, 2024
DOOMRETRO_VERSION = 791020a1e6afc7a0359bfb8f83b80750046b429a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
