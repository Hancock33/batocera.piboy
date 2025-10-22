################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 22, 2025
DOOMRETRO_VERSION = a04efb6efefaa9415b45c27830aaa6bf46a1914d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
