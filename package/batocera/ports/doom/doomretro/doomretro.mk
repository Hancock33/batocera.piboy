################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 24, 2025
DOOMRETRO_VERSION = 5b52b9ac38766ec70ec83bbf14a19b0dc7e5f3fd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
