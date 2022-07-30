################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 30, 2022
DOOMRETRO_VERSION = 787e5139c94f542e8f52e724adc097f07eb7b00a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
