################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 26, 2025
DOOMRETRO_VERSION = 26a3e1235a279ba195810118a1fbbca315d79fa8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
