################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2025
DOOMRETRO_VERSION = 4700ca4db38ab2655428f214d0cf861cde57a6d9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
