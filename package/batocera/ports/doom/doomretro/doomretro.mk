################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 25, 2023
DOOMRETRO_VERSION = fb88cb84654107d86f398b19cadee707150e41ec
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
