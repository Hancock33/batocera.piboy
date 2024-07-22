################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 22, 2024
DOOMRETRO_VERSION = f61d529a938ce6ccb65c21ec00ac1ef22da6cb7b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
