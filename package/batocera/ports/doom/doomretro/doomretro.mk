################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 12, 2024
DOOMRETRO_VERSION = 3a9db361380b1ecffd61eb6421447805b980584a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
