################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 30, 2025
DOOMRETRO_VERSION = ff80a30e9de3aa2c42002529e4e7fa1a438a8a9a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
