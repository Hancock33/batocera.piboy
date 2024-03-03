################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 02, 2024
DOOMRETRO_VERSION = 8ffb3354ee89fcdaeb619b20416db25de367287f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
