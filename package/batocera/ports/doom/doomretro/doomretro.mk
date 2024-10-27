################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 27, 2024
DOOMRETRO_VERSION = 8af07f46175d4abe4fe115466dd2c3db91110a61
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
