################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 22, 2026
DOOMRETRO_VERSION = 77b50d022af5f831a31c47ef4c77ca8d2dd4ba10
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
