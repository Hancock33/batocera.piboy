################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 26, 2025
DOOMRETRO_VERSION = 746c728d180fd6ff41352ba1cfae32034f193cf5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
