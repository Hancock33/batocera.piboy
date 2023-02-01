################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 01, 2023
DOOMRETRO_VERSION = ba44e33fb38e3e491d8215535b3a11829e75480f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
