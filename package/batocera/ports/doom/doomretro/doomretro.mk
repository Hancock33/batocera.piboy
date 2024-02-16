################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 16, 2024
DOOMRETRO_VERSION = 502c42fcf1ae50860034c0be1440946a56a9f0cd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
