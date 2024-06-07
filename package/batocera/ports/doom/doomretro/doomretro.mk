################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 07, 2024
DOOMRETRO_VERSION = fd8e0c2e8dde2cffc086dd13d684146b5b525487
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
