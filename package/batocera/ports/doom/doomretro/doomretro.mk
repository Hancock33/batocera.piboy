################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 29, 2022
DOOMRETRO_VERSION = ae9817415a5331921894f1dd28275fab689b3596
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
