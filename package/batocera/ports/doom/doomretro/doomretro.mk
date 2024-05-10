################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 10, 2024
DOOMRETRO_VERSION = 1100d0a9953bb13aab2f1f17866117336f637836
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
