################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2024
DOOMRETRO_VERSION = 9e39c0fbc94ce0371025a139d405897c161d8838
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
