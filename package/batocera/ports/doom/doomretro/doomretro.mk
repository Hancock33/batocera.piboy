################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 21, 2025
DOOMRETRO_VERSION = 26b5ea1c4150fe681026b0b93d80115eb9340da1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
