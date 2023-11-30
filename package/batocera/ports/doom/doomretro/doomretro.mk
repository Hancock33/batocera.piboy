################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 30, 2023
DOOMRETRO_VERSION = c89647b8ada27fb4f577c6a19ed6c24ceec0df9d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
