################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 11, 2022
DOOMRETRO_VERSION = e1d5dfb1cd80a9c49c76a5f196962a28731264f7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
