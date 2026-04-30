################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 30, 2026
DOOMRETRO_VERSION = 7fd4943c7fe5a4bd8e729d4c6d0f2d5cc9196799
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
