################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 22, 2025
DOOMRETRO_VERSION = 42c9a74691004a2a8e5187071b44811588fe8626
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
