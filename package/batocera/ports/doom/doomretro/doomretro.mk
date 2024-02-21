################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 21, 2024
DOOMRETRO_VERSION = 6a01cd0edda446d170f4528adb5b6f2a27fc5260
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
