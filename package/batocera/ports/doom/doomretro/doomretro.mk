################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 17, 2024
DOOMRETRO_VERSION = fffca118a53f6609f67c2ff1dc5da83c2d2f412d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
