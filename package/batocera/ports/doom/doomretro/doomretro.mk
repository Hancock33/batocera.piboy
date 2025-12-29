################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 29, 2025
DOOMRETRO_VERSION = e40e5839174ff04780c70909cc0765ac9d6c4e9b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
