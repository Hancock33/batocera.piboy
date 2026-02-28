################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 28, 2026
DOOMRETRO_VERSION = 5a223d12e4b1be2b36cbe8fcfeea1f39c967cf61
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
