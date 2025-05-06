################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 05, 2025
DOOMRETRO_VERSION = 9ab3c4dbf403ae4e89248a2dfee71d92e2e2c2c0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
