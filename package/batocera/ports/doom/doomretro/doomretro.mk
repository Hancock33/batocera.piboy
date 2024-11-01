################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 01, 2024
DOOMRETRO_VERSION = 05cfd4d1f950d2e8a9194af13c4883bb1d12675b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
