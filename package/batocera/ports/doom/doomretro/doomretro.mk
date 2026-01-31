################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 31, 2026
DOOMRETRO_VERSION = cd15520e87843dfa6e410137f37e169fa90b1e9b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
