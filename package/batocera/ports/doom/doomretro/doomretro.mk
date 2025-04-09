################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 09, 2025
DOOMRETRO_VERSION = c5799e0017ab546bcb6d4a573f55c4809ac0327e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
