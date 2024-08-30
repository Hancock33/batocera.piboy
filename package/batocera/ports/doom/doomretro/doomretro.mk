################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 30, 2024
DOOMRETRO_VERSION = bbbeb4ff7c8a4de78e6241ebf669dfb4ed8a1c61
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
