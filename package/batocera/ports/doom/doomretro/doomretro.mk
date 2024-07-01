################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 01, 2024
DOOMRETRO_VERSION = 334c3d8189b6b2ead124ee8f204ecc672db22597
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
