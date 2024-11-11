################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 11, 2024
DOOMRETRO_VERSION = e53468c42527d930a02866fb1173132c7fe62b5c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
