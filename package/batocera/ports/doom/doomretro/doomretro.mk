################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 10, 2024
DOOMRETRO_VERSION = df44f40afc5b661df0b0dcbec1d61c9efe01ffb2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
