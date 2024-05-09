################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 09, 2024
DOOMRETRO_VERSION = c8eba114c1aa3cbf9c310edb77d0ea9328be541a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
