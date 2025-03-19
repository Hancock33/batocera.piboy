################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 19, 2025
DOOMRETRO_VERSION = 579834ccded74b2c7062f7cc805c385c201c3850
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
