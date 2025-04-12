################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 12, 2025
DOOMRETRO_VERSION = a1f956ac5e25a04466c2c2a19eb1afbf0de4f6c7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
