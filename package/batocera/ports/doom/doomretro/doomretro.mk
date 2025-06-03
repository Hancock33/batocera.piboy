################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 03, 2025
DOOMRETRO_VERSION = bac90a1e65cba99a4b5f0752cc3b58c36814ba95
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
