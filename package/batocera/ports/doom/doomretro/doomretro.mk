################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 13, 2022
DOOMRETRO_VERSION = fc4c322d36732d8660afae390feee15180a6320e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
