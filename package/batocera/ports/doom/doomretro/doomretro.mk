################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 06, 2024
DOOMRETRO_VERSION = b73fa7b228bc9c884aadf401306c55e4f0726fcf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
