################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 28, 2026
DOOMRETRO_VERSION = ddde12d4b569f9908bdc1927627f4815968fe11d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
