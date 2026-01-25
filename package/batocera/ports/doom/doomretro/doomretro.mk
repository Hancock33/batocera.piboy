################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 25, 2026
DOOMRETRO_VERSION = c035207da8b070542e0f4848b3adecdbbd0e42fe
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
