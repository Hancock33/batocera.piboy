################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 05, 2023
DOOMRETRO_VERSION = 4e7daa5263db50f9ffa0137b342bb9026a5fc950
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
