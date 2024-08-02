################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 02, 2024
DOOMRETRO_VERSION = 031dec01eb357e1f7ad6ccc1d23ddf2f3ce81c5d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
