################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 22, 2022
DOOMRETRO_VERSION = be6e2c752197d6d89fe48cdc82332292a44d488a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
