################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 20, 2024
DOOMRETRO_VERSION = 20000befc2fd75e6ee2dcc39429e36f906274641
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
