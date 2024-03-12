################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 12, 2024
DOOMRETRO_VERSION = b61c06bac88468fed0fcdb06a3b942b417ebc3a0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
