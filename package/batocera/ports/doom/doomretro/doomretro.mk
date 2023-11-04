################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 04, 2023
DOOMRETRO_VERSION = 7e61bd9f98673f20bdc9996f0bad0a5871de4e15
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
