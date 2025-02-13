################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 13, 2025
DOOMRETRO_VERSION = 3e2bf4ec6379865ff6e6f24b18d4d2a15fd2baea
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
