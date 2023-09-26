################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 26, 2023
DOOMRETRO_VERSION = 4e99cc3153a2268d16688f295d7563dc929f0883
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
