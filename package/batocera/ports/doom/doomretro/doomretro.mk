################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 10, 2025
DOOMRETRO_VERSION = f42d8d9bfa6dcf9540c7038ae9b2a1132872404b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
