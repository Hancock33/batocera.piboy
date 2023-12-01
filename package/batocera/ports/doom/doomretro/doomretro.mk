################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 01, 2023
DOOMRETRO_VERSION = 546f154803410f2b3c5508b4cff4355a485e2bd0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
