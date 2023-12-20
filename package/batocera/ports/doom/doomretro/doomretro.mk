################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 20, 2023
DOOMRETRO_VERSION = 64fba4e94785fdc672062e15d50ac5bb1fa35aea
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
