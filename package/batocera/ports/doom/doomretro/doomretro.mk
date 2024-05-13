################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 13, 2024
DOOMRETRO_VERSION = ed1f213eb0f846cd255511e1e4409f5dd48435c5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
