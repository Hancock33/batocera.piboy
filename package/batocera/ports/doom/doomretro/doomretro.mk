################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 07, 2024
DOOMRETRO_VERSION = 758bbad41b9e5d90b809e5211128a3f1e8b8687a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
