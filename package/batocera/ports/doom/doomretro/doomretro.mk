################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 20, 2024
DOOMRETRO_VERSION = af102e4ef63a9d175f5e3a2517b9290011f34b64
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
