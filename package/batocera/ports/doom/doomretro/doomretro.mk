################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 10, 2025
DOOMRETRO_VERSION = 9f8c072667c22bdb823dc4d2a2ed92ee148f9236
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
