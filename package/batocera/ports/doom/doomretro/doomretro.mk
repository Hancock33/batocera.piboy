################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 25, 2023
DOOMRETRO_VERSION = 8ef2d56609da2a09ef1bc88ba11f61d26a8c74e7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
