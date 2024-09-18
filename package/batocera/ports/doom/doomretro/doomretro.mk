################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 18, 2024
DOOMRETRO_VERSION = 5a834343b18b78105704f84f140497eb622fb01b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
