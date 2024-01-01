################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 01, 2024
DOOMRETRO_VERSION = eeed1833dac8ab2995b499caddfb40fcfbabe7f5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
