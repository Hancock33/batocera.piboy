################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 17, 2023
DOOMRETRO_VERSION = e2e139b474d6fe07da23eb4a989a18616f89a30a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
