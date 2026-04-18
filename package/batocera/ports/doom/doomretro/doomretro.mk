################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 18, 2026
DOOMRETRO_VERSION = e7d4130aee7e397e70323ad2cf778afc8a11af22
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
