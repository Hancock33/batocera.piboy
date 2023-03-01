################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 01, 2023
DOOMRETRO_VERSION = ef8918aee9a823b3bf4f3a309b1ba558500aa263
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
