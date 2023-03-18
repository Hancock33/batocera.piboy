################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 18, 2023
DOOMRETRO_VERSION = a7dd60ab3d62147a52bf6b8052f1bd1515d8a880
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
