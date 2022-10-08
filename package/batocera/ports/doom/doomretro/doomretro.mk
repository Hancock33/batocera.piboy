################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 08, 2022
DOOMRETRO_VERSION = b54c0fb42da11621cc23d1096d54dc253b8f86f8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
