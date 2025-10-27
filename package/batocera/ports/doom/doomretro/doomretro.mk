################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 27, 2025
DOOMRETRO_VERSION = 1a345a8fa9de5ddd3df73ab546d496f5d6b662bc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
