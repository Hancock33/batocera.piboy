################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 29, 2024
DOOMRETRO_VERSION = 1758076b213645dd789712407681407cae49e7af
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
