################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 04, 2025
DOOMRETRO_VERSION = 544826b1268f2a4183313a0ed9110fda1f7963c3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
