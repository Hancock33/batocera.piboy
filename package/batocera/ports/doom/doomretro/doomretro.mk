################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 14, 2022
DOOMRETRO_VERSION = bc98c241261633b0a1b8e71b75d2e20a4f658e0e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
