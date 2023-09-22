################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 22, 2023
DOOMRETRO_VERSION = 76cc6e3be03725a628075046b8cad6610e19bed7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
