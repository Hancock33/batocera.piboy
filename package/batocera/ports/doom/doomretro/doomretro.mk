################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 07, 2025
DOOMRETRO_VERSION = 6e6bd89b34e3d342709bd7186c1b3a6272c223ac
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
