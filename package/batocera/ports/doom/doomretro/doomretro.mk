################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 24, 2025
DOOMRETRO_VERSION = 3953ddfff4cbef9233576e1aecdc005ff55b0a83
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
