################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 26, 2024
DOOMRETRO_VERSION = 2e63112abc2b87378645a27ccfe1acfd3984487b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
