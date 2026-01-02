################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 02, 2026
DOOMRETRO_VERSION = 14b721ba9597f7cd5a5f2e43692fb9fb7742ef4c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
