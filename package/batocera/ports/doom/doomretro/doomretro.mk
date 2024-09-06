################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 06, 2024
DOOMRETRO_VERSION = 3b6c91e75989627838b79b3754c5521261ca20cc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
