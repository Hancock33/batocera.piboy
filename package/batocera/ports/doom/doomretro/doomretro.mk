################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 05, 2025
DOOMRETRO_VERSION = d7f0e4744403485347f1f135af06ddb1c962c87e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
