################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 09, 2024
DOOMRETRO_VERSION = f4616bc262ec670d947d32516d9d55e6384ef731
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
