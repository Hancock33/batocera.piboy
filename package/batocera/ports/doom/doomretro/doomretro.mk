################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2023
DOOMRETRO_VERSION = 2978ecbe21d1a6dd0d9c55c2e2c0ab3ab66bb72d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
