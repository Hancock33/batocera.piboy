################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 21, 2022
DOOMRETRO_VERSION = 9c8734c98100ccdd856e57df51a21cda4ccf6eab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
