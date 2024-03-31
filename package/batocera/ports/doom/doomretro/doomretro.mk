################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 31, 2024
DOOMRETRO_VERSION = 7eb5b8c577864d8eb002b833fd3e40599d4c41ea
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
