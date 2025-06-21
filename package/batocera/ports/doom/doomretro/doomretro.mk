################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 20, 2025
DOOMRETRO_VERSION = 4a726fa271d7f90defca93dc24d11de6c001b05e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
