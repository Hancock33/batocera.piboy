################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 09, 2022
DOOMRETRO_VERSION = 36d08ebc7b90383eb5fec15ff636c2a0bcb18892
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
