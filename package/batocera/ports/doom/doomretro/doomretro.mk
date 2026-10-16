################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 16, 2026
DOOMRETRO_VERSION = ed7e5eb536e0ce3a59cc98fc2cd3d7a6dae0a0dc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
