################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 18, 2025
DOOMRETRO_VERSION = 36edc6497138e0dbe447cbdd65b53cb8d18d6826
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
