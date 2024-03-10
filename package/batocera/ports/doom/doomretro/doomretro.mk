################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 10, 2024
DOOMRETRO_VERSION = 402cf31ec31e40858d102b7a3787e04182e87f20
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
