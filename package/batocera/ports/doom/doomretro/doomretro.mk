################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 02, 2025
DOOMRETRO_VERSION = 0985928f19968883f4e3e771c51c74149653af53
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
