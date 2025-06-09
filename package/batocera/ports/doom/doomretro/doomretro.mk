################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 09, 2025
DOOMRETRO_VERSION = f8e18ab114d6facbaa4edaa868a82bdf2ce0beae
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
