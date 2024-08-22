################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 22, 2024
DOOMRETRO_VERSION = 182aa597cf90a95873022beb491eb9994dc38588
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
