################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 02, 2024
DOOMRETRO_VERSION = 1f74aef9b5ecc980332e9f74ba53a5c289a50d6f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
