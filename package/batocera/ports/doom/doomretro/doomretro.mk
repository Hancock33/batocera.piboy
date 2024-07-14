################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 14, 2024
DOOMRETRO_VERSION = 595f34b0fb3ec4309a78647bdfbb43f28084b6f4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
