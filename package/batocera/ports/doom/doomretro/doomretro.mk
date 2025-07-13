################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 13, 2025
DOOMRETRO_VERSION = 8ef1083b5448c85899efc8ec79e73199def872b6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
