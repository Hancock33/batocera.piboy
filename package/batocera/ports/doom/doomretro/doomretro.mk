################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 07, 2025
DOOMRETRO_VERSION = d09781a58277b7e2acb0bf51a14cf1efb0726935
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
