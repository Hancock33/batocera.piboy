################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 05, 2024
DOOMRETRO_VERSION = 13f7ba1ea42b32be3505e9816fe0f24a27487543
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
