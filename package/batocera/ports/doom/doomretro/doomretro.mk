################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 07, 2023
DOOMRETRO_VERSION = f5f5e222fe7c83ec5cd50b959ece7dfc99fc6cf7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
