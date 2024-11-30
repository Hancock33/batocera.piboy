################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 30, 2024
DOOMRETRO_VERSION = 1ccbf6610cc9d519e66b9692a029d9bc796bcfab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
