################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 11, 2025
DOOMRETRO_VERSION = 731aa096cd37a46b252dda1e89b0407f8db603a2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
