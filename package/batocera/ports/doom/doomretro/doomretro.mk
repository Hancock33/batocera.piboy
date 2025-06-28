################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 28, 2025
DOOMRETRO_VERSION = 09366bb6c642b06dbeb07a724f3b7e37366095c7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
