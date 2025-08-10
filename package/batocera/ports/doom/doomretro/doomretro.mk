################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 10, 2025
DOOMRETRO_VERSION = 21c3646575a2dcd53ad366fad30a129f59579b30
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
