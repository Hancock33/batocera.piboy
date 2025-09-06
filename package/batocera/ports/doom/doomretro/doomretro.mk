################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 06, 2025
DOOMRETRO_VERSION = bd805d7fb619c009191e29e6e3e495d64e603429
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
