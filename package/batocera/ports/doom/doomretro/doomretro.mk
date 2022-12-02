################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 02, 2022
DOOMRETRO_VERSION = 0ad646f7cc8b01201d84ef2deb1c97227d73d38d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
