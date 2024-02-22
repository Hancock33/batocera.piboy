################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 22, 2024
DOOMRETRO_VERSION = 0e72a4c223ea5ef95e749ee3a8684b9316070213
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
