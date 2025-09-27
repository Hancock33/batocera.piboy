################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 27, 2025
DOOMRETRO_VERSION = 2b7629a034e0e63cd7f9304196682db75ca9051d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
