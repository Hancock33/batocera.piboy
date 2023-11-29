################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2023
DOOMRETRO_VERSION = 499bca701593d8ed4ba4459507774932b41729de
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
