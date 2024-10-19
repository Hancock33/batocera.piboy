################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 19, 2024
DOOMRETRO_VERSION = 8f4d504b1a23c9778f2f1f37a8b1baee1c5c457e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
