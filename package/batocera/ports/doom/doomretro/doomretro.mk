################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 12, 2023
DOOMRETRO_VERSION = e78a540febe0b82cfc3a0118576a9da6be50da73
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
