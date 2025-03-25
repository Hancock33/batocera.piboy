################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 25, 2025
DOOMRETRO_VERSION = 8f2cd975a27ba4c629b6298a6ec296b0f7965216
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
