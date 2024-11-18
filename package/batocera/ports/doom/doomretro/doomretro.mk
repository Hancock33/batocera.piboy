################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 18, 2024
DOOMRETRO_VERSION = 2b7e84ab64b8dec4d6f8dd428e7e3b0a314716d1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
