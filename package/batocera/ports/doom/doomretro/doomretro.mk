################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 25, 2025
DOOMRETRO_VERSION = 3633d37330de3e0dfd7888752fcd2ca9a703a536
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
