################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 05, 2024
DOOMRETRO_VERSION = 0a72d9027db71f7859c163d16d4a51e6bcefe8a9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
