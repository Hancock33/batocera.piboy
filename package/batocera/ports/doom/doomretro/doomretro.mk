################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 13, 2024
DOOMRETRO_VERSION = 78c88c2c79ad05cfaa1c3facde655122820031b9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
