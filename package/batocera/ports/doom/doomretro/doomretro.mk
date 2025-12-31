################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 31, 2025
DOOMRETRO_VERSION = 986f1b0e50ab0990f7e7379e684c6a16fb92ba49
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
