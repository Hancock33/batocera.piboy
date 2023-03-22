################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 22, 2023
DOOMRETRO_VERSION = dbe9273ad496f8e1dcc3d04ff49918223b2b0db1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
