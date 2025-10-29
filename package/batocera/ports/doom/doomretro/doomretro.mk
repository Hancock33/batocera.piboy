################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 29, 2025
DOOMRETRO_VERSION = 11178ae256746235855b589556f94b9eff032d59
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
