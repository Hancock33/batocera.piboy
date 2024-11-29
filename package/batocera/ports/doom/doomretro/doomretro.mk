################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2024
DOOMRETRO_VERSION = 43b267b5870e002b162adcffa96db758cb377906
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
