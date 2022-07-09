################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 09, 2022
DOOMRETRO_VERSION = 7ebfbde820ad2ce7d9a68fb6c253409c04b6a1a3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
