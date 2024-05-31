################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 31, 2024
DOOMRETRO_VERSION = 9c1dc18b678563debd16d31bc5231c2c27357b8f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
