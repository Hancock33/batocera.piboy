################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 05, 2025
DOOMRETRO_VERSION = 4289393beb2178a97218d7876272d79a70577e9c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
