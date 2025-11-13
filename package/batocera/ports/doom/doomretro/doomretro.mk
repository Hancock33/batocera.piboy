################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 13, 2025
DOOMRETRO_VERSION = d9e7252420fa098c1af8321581049eb9337c05f3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
