################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 01, 2023
DOOMRETRO_VERSION = ec3967f5a353758f042f190835b8b1b03e5b75b7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
