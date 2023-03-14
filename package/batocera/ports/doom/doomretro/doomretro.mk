################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 14, 2023
DOOMRETRO_VERSION = 639582e17ff8ffd821f50260041ec8e0d135f676
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
