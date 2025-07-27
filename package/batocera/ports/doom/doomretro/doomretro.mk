################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 27, 2025
DOOMRETRO_VERSION = 369e26ab2f18b76ded2f5a849c376f0a37f2bc9a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
