################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 01, 2024
DOOMRETRO_VERSION = afcd173f607ec633ebc7c7ffa2d8ee13bc1b59f0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
