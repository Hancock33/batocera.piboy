################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 08, 2025
DOOMRETRO_VERSION = 42b50d1acba3252d633c7aa89d56857f075becb6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
