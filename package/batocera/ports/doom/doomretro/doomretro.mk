################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2025
DOOMRETRO_VERSION = 46f00fe7eff1ec11b4462b4c72b33ba393dc5819
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
