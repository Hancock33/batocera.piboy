################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 03, 2023
DOOMRETRO_VERSION = 933ab911ebe477c540d8dbd447b5616545a53c07
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
