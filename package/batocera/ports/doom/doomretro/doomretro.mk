################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 30, 2024
DOOMRETRO_VERSION = f97b2814f4e71ab36a75b86eb09e4e590401d741
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
