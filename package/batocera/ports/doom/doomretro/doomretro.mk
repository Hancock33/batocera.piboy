################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 05, 2025
DOOMRETRO_VERSION = 6d2d8c0367837788a3f863a32dd781f9e610b96f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
