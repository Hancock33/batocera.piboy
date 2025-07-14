################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 14, 2025
DOOMRETRO_VERSION = d1606903b10e3436f8fb60c8a2581a89313e9c9a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
