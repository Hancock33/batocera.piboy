################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 28, 2025
DOOMRETRO_VERSION = c01f4f3fdc3cf06123d232b29a374bcbe36792f6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
