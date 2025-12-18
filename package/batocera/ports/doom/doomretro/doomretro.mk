################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 18, 2025
DOOMRETRO_VERSION = 4606f6f01c418b4e09d782357a2dc05266bf9e19
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
