################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 02, 2022
DOOMRETRO_VERSION = f23a56d3c8b617d3b4e2ca98e1046cd801837f36
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
