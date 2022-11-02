################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 02, 2022
DOOMRETRO_VERSION = 49c774e8de3dcc221497468c0fb111bd8a6bab1b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
