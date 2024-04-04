################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 04, 2024
DOOMRETRO_VERSION = 97f01a7405a964fed65bf4f259ac78a41f0144f9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
