################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2025
DOOMRETRO_VERSION = 649ac7d4900a9e797e5f4129628ce23cea3e8e9d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
