################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 11, 2025
DOOMRETRO_VERSION = e1a07de1e1b209ee683b9be88f8fe51b4530542a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
