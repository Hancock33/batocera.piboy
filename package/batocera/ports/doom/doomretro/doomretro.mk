################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 04, 2025
DOOMRETRO_VERSION = 29aeae614094bfe8ddc9e3e2fe07b9c4b5db96ac
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
