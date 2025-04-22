################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 22, 2025
DOOMRETRO_VERSION = aee9b44ce70f3d78bab62a0d2fabbe09f491b661
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
