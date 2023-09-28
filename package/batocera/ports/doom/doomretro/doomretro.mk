################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 28, 2023
DOOMRETRO_VERSION = 392524620f9f911f6394ad9e30cb18d6969f04c1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
