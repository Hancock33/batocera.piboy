################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 23, 2023
DOOMRETRO_VERSION = 32139ddb4cc1a97d19a641b215c504baf2002413
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
