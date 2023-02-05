################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 05, 2023
DOOMRETRO_VERSION = 4cd54413b13d1f2639b91d784cc835459890b505
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
