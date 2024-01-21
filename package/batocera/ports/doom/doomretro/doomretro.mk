################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 21, 2024
DOOMRETRO_VERSION = 0f724b47243c3d750aa022ee3a76d41f9584120d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
