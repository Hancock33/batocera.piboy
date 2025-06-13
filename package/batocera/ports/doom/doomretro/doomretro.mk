################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 13, 2025
DOOMRETRO_VERSION = a1631ac0a01545b395946c6d0970139a10340d79
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
