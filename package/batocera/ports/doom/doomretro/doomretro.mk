################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 20, 2025
DOOMRETRO_VERSION = 2ac914e451da2c68eab3f5cccb5b8bef863283de
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
