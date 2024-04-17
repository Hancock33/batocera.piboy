################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 17, 2024
DOOMRETRO_VERSION = fcfb76566fa765521e82732631a1613351244124
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
