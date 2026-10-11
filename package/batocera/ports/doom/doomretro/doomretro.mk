################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 11, 2026
DOOMRETRO_VERSION = d5aaaf88a50c32ce1e3e6d4b2fadabb7b9c0da6e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
