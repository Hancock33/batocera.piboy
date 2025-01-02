################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 02, 2025
DOOMRETRO_VERSION = f6b75060e258188f2f2a95da0a2b0ce7bf418782
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
