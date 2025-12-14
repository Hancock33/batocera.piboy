################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 14, 2025
DOOMRETRO_VERSION = aa66521b53c10b3f8fcf8b03953a7106f6ac95d6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
