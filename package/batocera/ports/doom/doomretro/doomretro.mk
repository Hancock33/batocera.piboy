################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 27, 2026
DOOMRETRO_VERSION = cb2fa469d88c65c9c97da474c626a1ed8fef29d3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
