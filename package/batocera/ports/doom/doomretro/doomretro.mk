################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 04, 2024
DOOMRETRO_VERSION = b2c33a6fe7f06c839b6e22a607e7d446d81b712d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
