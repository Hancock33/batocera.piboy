################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 08, 2023
DOOMRETRO_VERSION = 74d666fe76b70c70cb8388d351c9bb2babb1f1db
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
