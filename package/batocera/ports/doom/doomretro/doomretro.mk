################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2025
DOOMRETRO_VERSION = 96a4de211977c45b9099429b9fe5879ef8a25648
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
