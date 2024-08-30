################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 30, 2024
DOOMRETRO_VERSION = 2799a3f2a042180582d4a2abce26fefd03ef1bb4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
