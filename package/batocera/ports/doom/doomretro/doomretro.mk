################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 17, 2025
DOOMRETRO_VERSION = ed3361319f655e18505559af9f80356fd4de5be2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
