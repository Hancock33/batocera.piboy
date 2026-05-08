################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 07, 2026
DOOMRETRO_VERSION = 64a84f1b2bd284d123554ed50c03724c30b41d58
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
