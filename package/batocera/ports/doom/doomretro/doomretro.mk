################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 08, 2025
DOOMRETRO_VERSION = 475775911ad53216ad93658db7e38a8b651d09be
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
