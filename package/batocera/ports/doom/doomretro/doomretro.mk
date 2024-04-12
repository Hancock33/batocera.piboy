################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 12, 2024
DOOMRETRO_VERSION = fa4b9abaa7503dd987415fce856a995f57b32873
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
