################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 16, 2022
DOOMRETRO_VERSION = 8253c44cf578394127ca67308405eeda043a0322
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
