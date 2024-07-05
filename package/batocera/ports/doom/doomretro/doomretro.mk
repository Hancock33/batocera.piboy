################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 05, 2024
DOOMRETRO_VERSION = 8d0804de91e35e110f91fd51615f7090d1e8279f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
