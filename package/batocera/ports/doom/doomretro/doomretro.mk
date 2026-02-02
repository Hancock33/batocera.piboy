################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 02, 2026
DOOMRETRO_VERSION = b872193bfe89734a20a42426c34460042671fa40
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
