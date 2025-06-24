################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 24, 2025
DOOMRETRO_VERSION = 01203a0338e226b8cacea9fb35fd2d1bc77c8b8f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
